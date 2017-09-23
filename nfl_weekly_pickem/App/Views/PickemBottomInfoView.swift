//
//  PickemBottomInfoView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class PickemBottomInfoView: UIView {
    
    private let gameTitleLabel = UILabel()
    private let atCircleView = UIView()
    private let timeLabel = UILabel()
    
    
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(gameTitleLabel)
        addSubview(atCircleView)
        addSubview(timeLabel)
        
        gameTitleLabel.textAlignment = .center
        timeLabel.textAlignment = .center
        
        gameTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        atCircleView.snp.makeConstraints { (make) in
            make.top.equalTo(gameTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(atCircleView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
