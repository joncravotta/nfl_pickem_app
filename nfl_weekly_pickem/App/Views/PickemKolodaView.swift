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
    let dividerHorizontalView = UIView()
    let awayTeamView = PickemTeamInfoView()
    let homeTeamView = PickemTeamInfoView()
    let bottomInfoView = PickemBottomInfoView()
    
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
            
            bottomInfoView.gameTitleString = game.gameInfo.gameTitle
            bottomInfoView.timeLabelString = game.gameInfo.gameTime
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
        dividerHorizontalView.backgroundColor = .nflLightGray
        dividerVerticalView.backgroundColor = .nflLightGray
        
        containerView.addSubview(awayTeamView)
        containerView.addSubview(homeTeamView)
        containerView.addSubview(bottomInfoView)
        containerView.addSubview(dividerVerticalView)
        containerView.addSubview(dividerHorizontalView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.width.equalTo(370)
            make.height.equalTo(545)
            make.center.equalToSuperview()
        }
        
        bottomInfoView.snp.makeConstraints { (make) in
            make.bottom.width.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        dividerVerticalView.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(dividerHorizontalView.snp.top)
        }
        
        dividerHorizontalView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.width.centerX.equalToSuperview()
            make.bottom.equalTo(bottomInfoView.snp.top)
        }
        
        awayTeamView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview()
            make.bottom.equalTo(dividerHorizontalView.snp.bottom)
            make.trailing.equalTo(dividerVerticalView.snp.leading)
        }
        
        homeTeamView.snp.makeConstraints { (make) in
            make.trailing.top.equalToSuperview()
            make.bottom.equalTo(dividerHorizontalView.snp.bottom)
            make.leading.equalTo(dividerVerticalView.snp.trailing)
        }
    }
}
