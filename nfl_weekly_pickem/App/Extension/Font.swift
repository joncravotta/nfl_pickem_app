//
//  Font.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

enum FontType {
    case bold
    case regular
    case boldItalic
    
    var name: String {
        switch self {
        case .bold: return "AvenirNext-Bold"
        case .regular: return "AvenirNext-Regular"
        case .boldItalic: return "AvenirNext-BoldItalic"
        }
    }
}

extension UIFont {
    class func font(withType type: FontType, withSize size: CGFloat) -> UIFont {
        return UIFont(name: type.name, size: size)!
    }
}
