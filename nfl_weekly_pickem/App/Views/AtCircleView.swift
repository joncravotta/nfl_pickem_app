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
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setUpView() {
        addSubview(circle)
        circle.addSubview(atLabel)
        
        
        circle.snp.makeConstraints { (make) in
            <#code#>
        }
    }
}
