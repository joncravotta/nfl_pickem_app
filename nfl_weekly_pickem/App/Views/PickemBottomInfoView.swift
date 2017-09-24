//
//  PickemBottomInfoView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class PickemGameInfoView: UIView {
    
    private let gameTitleLabel = UILabel()
    private let atCircleView = AtCircleView()
    private let timeLabel = UILabel()
    
    var gameTitleString: String = "" {
        didSet {
            gameTitleLabel.text = gameTitleString
        }
    }
    
    var timeLabelString: String = "" {
        didSet {
            timeLabel.text = timeLabelString
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(gameTitleLabel)
        addSubview(atCircleView)
        addSubview(timeLabel)
        
        gameTitleLabel.textAlignment = .center
        gameTitleLabel.font = UIFont.font(withType: .bold, withSize: 12)
        gameTitleLabel.textColor = .nflDarkGray
        
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.font(withType: .bold, withSize: 12)
        timeLabel.textColor = .nflDarkGray
        
        gameTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(atCircleView.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        atCircleView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(atCircleView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
