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
    public class var bengalsPrimary:UIColor { return UIColor.color(withRed:252,  green:72,  blue:2) }
    public class var packersPrimary:UIColor { return UIColor.color(withRed:23,  green:94,  blue:34) }
    public class var chiefsPrimary:UIColor { return UIColor.color(withRed:200,  green:16,  blue:56) }
    public class var chargersPrimary:UIColor { return UIColor.color(withRed:12,  green:35,  blue:64) }
    
    public class var ravensPrimary:UIColor { return UIColor.color(withRed:26,  green:25,  blue:95) }
    public class var jaguarsPrimary:UIColor { return UIColor.color(withRed:0,  green:96,  blue:115) }
    public class var broncosPrimary:UIColor { return UIColor.color(withRed:252,  green:76,  blue:2) }
    public class var billsPrimary:UIColor { return UIColor.color(withRed:12,  green:46,  blue:130) }
    public class var brownsPrimary:UIColor { return UIColor.color(withRed:56,  green:47,  blue:45) }
    public class var coltsPrimary:UIColor { return UIColor.color(withRed:0,  green:20,  blue:137) }
    public class var falconsPrimary:UIColor { return UIColor.color(withRed:166,  green:25,  blue:46) }
    public class var lionsPrimary:UIColor { return UIColor.color(withRed:0,  green:105,  blue:177) }
    
    fileprivate class func color(withRed red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1) -> UIColor {
        return UIColor(red:red/255.0, green:green/255.0, blue: blue/255.0, alpha:alpha)
    }
}
