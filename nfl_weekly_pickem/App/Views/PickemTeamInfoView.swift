//
//  PickemTeamInfoView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class PickemTeamInfoView: UIView {
    
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let logoImageView = UIImageView()
    private let spreadPercentageLabel = UILabel()
    
    var nameLabelString: String = "" {
        didSet {
            nameLabel.text = nameLabelString
        }
    }
    
    var logoImage: UIImage? = nil {
        didSet {
            guard let image = logoImage else { return }
            logoImageView.image = image
        }
    }
    
    var spreadPercentageLabelString: String = "" {
        didSet {
            spreadPercentageLabel.text = spreadPercentageLabelString
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(containerView)
        containerView.backgroundColor = .white
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(logoImageView)
        containerView.addSubview(spreadPercentageLabel)
        
        nameLabel.textAlignment = .center
        spreadPercentageLabel.textAlignment = .center
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        spreadPercentageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
    }
}
