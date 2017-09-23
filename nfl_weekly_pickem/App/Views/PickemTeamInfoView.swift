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
    private let recordLabel = UILabel()
    private let atsRecordLabel = UILabel()
    private let lastTenRecordLabel = UILabel()
    
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
    
    var recordLabelString: String = "" {
        didSet {
            recordLabel.text = "Record: \(recordLabelString)"
        }
    }
    
    var atsRecordLabelString: String = "" {
        didSet {
            atsRecordLabel.text = "ATS: \(atsRecordLabelString)"
        }
    }
    
    var lastTenRecordLabelString: String = "" {
        didSet {
            lastTenRecordLabel.text = "L10: \(lastTenRecordLabelString)"
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
        containerView.addSubview(recordLabel)
        containerView.addSubview(atsRecordLabel)
        containerView.addSubview(lastTenRecordLabel)
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.font(withType: .bold, withSize: 22)
        nameLabel.textColor = .nflDarkGray
        
        spreadPercentageLabel.textAlignment = .center
        spreadPercentageLabel.font = UIFont.font(withType: .boldItalic, withSize: 22)
        spreadPercentageLabel.textColor = .nflDarkGreen
        
        recordLabel.textAlignment = .center
        recordLabel.font = UIFont.font(withType: .regular, withSize: 11)
        recordLabel.textColor = .nflDarkGray
        
        atsRecordLabel.textAlignment = .center
        atsRecordLabel.font = UIFont.font(withType: .regular, withSize: 11)
        atsRecordLabel.textColor = .nflDarkGray
        
        lastTenRecordLabel.textAlignment = .center
        lastTenRecordLabel.font = UIFont.font(withType: .regular, withSize: 11)
        lastTenRecordLabel.textColor = .nflDarkGray
        
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
        
        recordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(spreadPercentageLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        
        atsRecordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(recordLabel.snp.bottom).offset(5)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        
        lastTenRecordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(atsRecordLabel.snp.bottom).offset(5)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
    }
}
