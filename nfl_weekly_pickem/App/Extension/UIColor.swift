//
//  UIColor.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class var nflDarkGreen:UIColor { return UIColor.color(withRed:3,  green:134,  blue:100) }
    public class var nflSeaGreen:UIColor { return UIColor.color(withRed:3,  green:134,  blue:100) }
    public class var nflLightGray:UIColor { return UIColor.color(withRed:216,  green:216,  blue:216) }
    public class var nflDarkGray:UIColor { return UIColor.color(withRed:59,  green:59,  blue:59) }
    public class var giantsPrimary:UIColor { return UIColor.color(withRed:0,  green:30,  blue:98) }
    public class var eaglesPrimary:UIColor { return UIColor.color(withRed:0,  green:72,  blue:81) }
    public class var saintsPrimary:UIColor { return UIColor.color(withRed:162,  green:141,  blue:91) }
    public class var panthersPrimary:UIColor { return UIColor.color(withRed:0,  green:131,  blue:202) }
    
    fileprivate class func color(withRed red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1) -> UIColor {
        return UIColor(red:red/255.0, green:green/255.0, blue: blue/255.0, alpha:alpha)
    }
}
