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
    public class var nflSeaGreen:UIColor { return UIColor.color(withRed:40,  green:219,  blue:167) }
    public class var nflLightGray:UIColor { return UIColor.color(withRed:216,  green:216,  blue:216) }
    public class var nflDarkGray:UIColor { return UIColor.color(withRed:59,  green:59,  blue:59) }
    public class var giantsPrimary:UIColor { return UIColor.color(withRed:0,  green:30,  blue:98) }
    public class var eaglesPrimary:UIColor { return UIColor.color(withRed:0,  green:72,  blue:81) }
    public class var saintsPrimary:UIColor { return UIColor.color(withRed:162,  green:141,  blue:91) }
    public class var panthersPrimary:UIColor { return UIColor.color(withRed:0,  green:131,  blue:202) }
    public class var steelersPrimary:UIColor { return UIColor.color(withRed:255,  green:184,  blue:28) }
    public class var bearsPrimary:UIColor { return UIColor.color(withRed:5,  green:28,  blue:44) }
    public class var doliphinsPrimary:UIColor { return UIColor.color(withRed:0,  green:142,  blue:151) }
    public class var jetsPrimary:UIColor { return UIColor.color(withRed:12,  green:55,  blue:29) }
    
    fileprivate class func color(withRed red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1) -> UIColor {
        return UIColor(red:red/255.0, green:green/255.0, blue: blue/255.0, alpha:alpha)
    }
}
