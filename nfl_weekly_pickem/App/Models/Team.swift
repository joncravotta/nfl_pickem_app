//
//  Team.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

enum Team {
    case saints
    case panthers
    case giants
    case eagles
    
    var city: String {
        switch self {
        case .saints: return "New Orleans"
        case .panthers: return "Carolina"
        case .giants: return "New York"
        case .eagles: return "Philadelphia"
        }
    }
    
    var name: String {
        switch self {
        case .saints: return "Saints"
        case .panthers: return "Panthers"
        case .giants: return "Giants"
        case .eagles: return "Eagles"
        }
    }
    
    var logo: UIImage {
        switch self {
        case .saints: return UIImage(named: "saints_logo")!
        case .panthers: return UIImage(named: "panthers_logo")!
        case .giants: return UIImage(named: "giants_logo")!
        case .eagles: return UIImage(named: "eagles_logo")!
        }
    }
    
    var primaryColor: UIColor {
        switch self {
        case .saints: return .saintsPrimary
        case .panthers: return .panthersPrimary
        case .giants: return .giantsPrimary
        case .eagles: return .eaglesPrimary
        }
    }
}


