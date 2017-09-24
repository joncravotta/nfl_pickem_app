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
    
    private let awayTeamView = PickemEditTeamViewCell(alignment: .left)
    private let homeTeamView = PickemEditTeamViewCell(alignment: .right)
    
    var game: Game? = nil {
        didSet {
            guard let game = game else { return }
            awayTeamView.teamInfo = (team: game.awayTeam, stats: game.awayTeamStat)
            homeTeamView.teamInfo = (team: game.homeTeam, stats: game.homeTeamStat)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(awayTeamView)
        addSubview(homeTeamView)
        
        awayTeamView.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        homeTeamView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
}
