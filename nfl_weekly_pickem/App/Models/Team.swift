//
//  Team.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

enum Team: String {
    case saints
    case panthers
    case giants
    case eagles
    case steelers
    case bears
    case doliphins
    case jets
    
    case bengals
    case packers
    case chiefs
    case chargers
    
    var city: String {
        switch self {
        case .saints: return "New Orleans"
        case .panthers: return "Carolina"
        case .giants: return "New York"
        case .eagles: return "Philadelphia"
        case .steelers: return "Pittsburgh"
        case .bears: return " Chicago"
        case .doliphins: return "Miami"
        case .jets: return "New York"
        case .chiefs: return "Kansas City"
        case .chargers: return "Los Angeles"
        }
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
    
    var logo: UIImage {
        switch self {
        case .saints: return UIImage(named: "saints_logo")!
        case .panthers: return UIImage(named: "panthers_logo")!
        case .giants: return UIImage(named: "giants_logo")!
        case .eagles: return UIImage(named: "eagles_logo")!
        case .steelers: return UIImage(named: "steelers_logo")!
        case .bears: return UIImage(named: "bears_logo")!
        case .doliphins: return UIImage(named: "doliphins_logo")!
        case .jets: return UIImage(named: "jets_logo")!
        }
    }
    
    var primaryColor: UIColor {
        switch self {
        case .saints: return .saintsPrimary
        case .panthers: return .panthersPrimary
        case .giants: return .giantsPrimary
        case .eagles: return .eaglesPrimary
        case .steelers: return .steelersPrimary
        case .bears: return .bearsPrimary
        case .doliphins: return .doliphinsPrimary
        case .jets: return .jetsPrimary
        }
    }
}


