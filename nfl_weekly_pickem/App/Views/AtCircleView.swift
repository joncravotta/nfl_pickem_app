//
//  atCircleView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class AtCircleView: UIView {
    
    private let circle = UIView()
    private let atLabel = UILabel()
    private let circleSize = 26
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setUpView() {
        addSubview(circle)
        circle.addSubview(atLabel)
        
        atLabel.text = "AT"
        atLabel.font = UIFont.font(withType: .bold, withSize: 9)
        atLabel.textColor = .white
        atLabel.textAlignment = .center
        circle.backgroundColor = .nflDarkGreen
        circle.layer.cornerRadius = CGFloat(circleSize / 2)
        
        circle.snp.makeConstraints { (make) in
            make.width.equalTo(circleSize)
            make.height.equalTo(circleSize)
            make.center.equalToSuperview()
        }
        
        atLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
