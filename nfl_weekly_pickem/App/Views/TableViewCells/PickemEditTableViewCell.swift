//
//  PickemEditTableViewCell.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class PickemEditTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let awayTeamView = PickemEditTeamView(alignment: .left)
    private let homeTeamView = PickemEditTeamView(alignment: .right)
    private let divider = UIView()
    fileprivate let feedBackGenerator = UINotificationFeedbackGenerator()
    
    var didChangePick:((Pick)->())? = nil
    
    var pick: Pick? = nil {
        didSet {
            guard let pick = pick else { return }
            awayTeamView.teamInfo = (team: pick.game.awayTeam, stats: pick.game.awayTeamStat)
            homeTeamView.teamInfo = (team: pick.game.homeTeam, stats: pick.game.homeTeamStat)
            
            switch pick.homeOrAway {
            case .home: homeTeamSelected()
            case .away: awayTeamSelected()
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        self.selectionStyle = .none
        feedBackGenerator.prepare()
        
        addSubview(containerView)
        containerView.addSubview(awayTeamView)
        containerView.addSubview(homeTeamView)
        containerView.addSubview(divider)
        containerView.setCellShadow()
        
        containerView.backgroundColor = .white
        self.backgroundColor = .white
        
        let homeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedHomeTeam))
        let awayTapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedAwayTeam))
        
        homeTeamView.addGestureRecognizer(homeTapGesture)
        awayTeamView.addGestureRecognizer(awayTapGesture)
        
        divider.backgroundColor = .white
        
       
        
        containerView.snp.makeConstraints { (make) in
            make.leading.trailing.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.85)
        }
        
        divider.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalTo(1)
            make.center.equalToSuperview()
        }
        
        awayTeamView.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(divider.snp.leading)
        }
        
        homeTeamView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(divider.snp.trailing)
        }
    }
    
    func tappedHomeTeam() {
        feedBackGenerator.notificationOccurred(.success)
        homeTeamSelected()
        guard let pick = pick else { return }
        didChangePick?(Pick(game: pick.game, team: pick.game.homeTeam, homeOrAway: .home))
    }
    
    func tappedAwayTeam() {
        feedBackGenerator.notificationOccurred(.success)
        awayTeamSelected()
        guard let pick = pick else { return }
        didChangePick?(Pick(game: pick.game, team: pick.game.awayTeam, homeOrAway: .away))
    }
    
    private func homeTeamSelected() {
        homeTeamView.isSelected = true
        awayTeamView.isSelected = false
    }
    
    private func awayTeamSelected() {
        homeTeamView.isSelected = false
        awayTeamView.isSelected = true
    }
}
