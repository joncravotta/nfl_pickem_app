//
//  PickemEditTeamView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit



class PickemEditTeamView: UIView {
    
    var teamInfo: (team: Team, stats: TeamStat)? = nil {
        didSet {
            guard let teamInfo = teamInfo else { return }
            nameLabel.text  = teamInfo.team.name
            spreadLabel.text = teamInfo.stats.spread
            recordLabel.text = "2 - 0"
            teamLogoImageView.image = teamInfo.team.logo
        }
    }
    
    var isSelected: Bool = false {
        didSet {
            toggleColors()
        }
    }
    
    // MARK: Private
    private let nameLabel = UILabel()
    private let spreadLabel = UILabel()
    private let recordLabel = UILabel()
    private let teamLogoImageView = UIImageView()
    private let selectedView = UIView()
    private let alignment: Alignment
    
    init(alignment: Alignment) {
        self.alignment = alignment
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(nameLabel)
        addSubview(spreadLabel)
        addSubview(recordLabel)
        addSubview(teamLogoImageView)
        addSubview(selectedView)
        
        toggleColors()
        
        nameLabel.font = UIFont.font(withType: .bold, withSize: 18)
        spreadLabel.font = UIFont.font(withType: .boldItalic, withSize: 14)
        recordLabel.font = UIFont.font(withType: .regular, withSize: 10)
        
        nameLabel.textColor = .nflDarkGray
        spreadLabel.textColor = .nflDarkGray
        recordLabel.textColor = .nflDarkGray
        
        switch alignment {
        case .left:
            nameLabel.textAlignment = .left
            spreadLabel.textAlignment = .left
        case .right:
            nameLabel.textAlignment = .right
            spreadLabel.textAlignment = .right
        }
        
        recordLabel.textAlignment = .center
        teamLogoImageView.contentMode = .scaleAspectFit
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        teamLogoImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-10)
            make.width.equalTo(45)
            
            switch alignment {
            case .left: make.leading.equalToSuperview().offset(25)
            case .right: make.trailing.equalToSuperview().offset(-25)
            }
        }
        
        recordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teamLogoImageView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalTo(teamLogoImageView)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(teamLogoImageView.snp.top).offset(10)
            
            switch alignment {
            case .left:
                make.leading.equalTo(teamLogoImageView.snp.trailing).offset(15)
                make.trailing.equalToSuperview().offset(-25)
            case .right:
                make.trailing.equalTo(teamLogoImageView.snp.leading).offset(-15)
                make.leading.equalToSuperview().offset(15)
            }
        }
        
        spreadLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(recordLabel.snp.bottom)
            
            switch alignment {
            case .left:
                make.leading.equalTo(nameLabel.snp.leading)
                make.trailing.equalToSuperview().offset(-25)
            case .right:
                make.trailing.equalTo(nameLabel.snp.trailing)
                make.leading.equalToSuperview().offset(15)
            }
            
        }
        
        selectedView.snp.makeConstraints { (make) in
            
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(5)
        }
    }
    
    private func toggleColors() {
        if isSelected {
           selectedView.backgroundColor = .nflSeaGreen
        } else {
          selectedView.backgroundColor = .white
        }
    }
}
