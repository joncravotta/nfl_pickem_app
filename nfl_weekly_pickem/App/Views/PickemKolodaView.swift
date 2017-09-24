//
//  PickemKolodaView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import Koloda


class PickemKolodaView: UIView {
    
    let containerView = UIView()
    let dividerVerticalView = UIView()
    let awayTeamView = PickemTeamInfoView()
    let homeTeamView = PickemTeamInfoView()
    
    var game: Game? = nil {
        didSet {
            guard let game = game else { return }
            awayTeamView.nameLabelString = game.awayTeam.city
            homeTeamView.nameLabelString = game.homeTeam.city
            
            awayTeamView.logoImage = game.awayTeam.logo
            homeTeamView.logoImage = game.homeTeam.logo
            
            awayTeamView.spreadPercentageLabelString = game.awayTeamStat.spread
            homeTeamView.spreadPercentageLabelString = game.homeTeamStat.spread
            
            awayTeamView.recordLabelString        = game.awayTeamStat.record
            awayTeamView.atsRecordLabelString     = game.awayTeamStat.recordATS
            awayTeamView.lastTenRecordLabelString = game.awayTeamStat.lastTenRecord
            
            homeTeamView.recordLabelString        = game.homeTeamStat.record
            homeTeamView.atsRecordLabelString     = game.homeTeamStat.recordATS
            homeTeamView.lastTenRecordLabelString = game.homeTeamStat.lastTenRecord
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        setShadow()
        addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        dividerVerticalView.backgroundColor = .nflLightGray
        
        containerView.addSubview(awayTeamView)
        containerView.addSubview(homeTeamView)
        containerView.addSubview(dividerVerticalView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.center.equalToSuperview()
        }
        
        dividerVerticalView.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        awayTeamView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalTo(dividerVerticalView.snp.leading)
        }
        
        homeTeamView.snp.makeConstraints { (make) in
            make.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(dividerVerticalView.snp.trailing)
        }
    }
}
