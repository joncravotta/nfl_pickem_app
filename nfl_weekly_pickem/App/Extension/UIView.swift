//
//  UIView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.17
        layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.shadowRadius = 10
        //layer.cornerRadius = 8
    }
    
    func setCellShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.17
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
    }
}

enum Alignment {
    case left
    case right
}
