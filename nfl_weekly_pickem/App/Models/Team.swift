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
    case ravens
    case jaguars
    case broncos
    case bills
    case browns
    case colts
    case falcons
    case lions
    
    case rams
    case cowboys
    case vikings
    case patriots
    case titans
    case texans
    case bucaneers
    case forty
    case cardinals
    case raiders
    case seahawks
    case redskins
    
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
        case .bengals: return "Cincinnati"
        case .packers: return "Green Bay"
        case .chiefs: return "Kansas City"
        case .chargers: return "Los Angeles"
        case .ravens: return "Baltimore"
        case .jaguars: return "Jacksonville"
        case .broncos: return "Denver"
        case .bills: return "Buffalo"
        case .browns: return "Cleveland"
        case .colts: return "Indianopolis"
        case .falcons: return "Atlanta"
        case .lions: return "Detriot"
        case .rams: return "Los Angeles"
        case .cowboys: return "Dallas"
        case .vikings: return "Minnesota"
        case .patriots: return "New England"
        case .titans: return "Tennessee"
        case .texans: return "Houston"
        case .bucaneers: return "Tampa Bay"
        case .forty: return "San Francisco"
        case .cardinals: return "Arizona"
        case .raiders: return "Oakland"
        case .seahawks: return "Seattle"
        case .redskins: return "Washington"
        }
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
    
    var logo: UIImage {
        return UIImage(named: "\(name.lowercased())_logo")!
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
        case .bengals: return .bengalsPrimary
        case .packers: return .packersPrimary
        case .chiefs: return .chiefsPrimary
        case .chargers: return .chargersPrimary
        case .ravens: return .ravensPrimary
        case .jaguars: return .jaguarsPrimary
        case .broncos: return .broncosPrimary
        case .bills: return .billsPrimary
        case .browns: return .brownsPrimary
        case .colts: return .coltsPrimary
        case .falcons: return .falconsPrimary
        case .lions: return .lionsPrimary
        case .rams:
            return .lionsPrimary
        case .cowboys:
            return .lionsPrimary
        case .vikings:
            return .lionsPrimary
        case .patriots:
            return .lionsPrimary
        case .titans:
            return .lionsPrimary
        case .texans:
            return .lionsPrimary
        case .bucaneers:
            return .lionsPrimary
        case .forty:
            return .lionsPrimary
        case .cardinals:
            return .lionsPrimary
        case .raiders:
            return .lionsPrimary
        case .seahawks:
            return .lionsPrimary
        case .redskins:
            return .lionsPrimary
        }
    }
    
    var shortName: String {
        switch self {
        case .saints: return "NO"
        case .panthers: return "CAR"
        case .giants: return "NYG"
        case .eagles: return "PHI"
        case .steelers: return "PIT"
        case .bears: return "CHI"
        case .doliphins: return "MIA"
        case .jets: return "NYJ"
        case .bengals: return "CIN"
        case .packers: return "GB"
        case .chiefs: return "KC"
        case .chargers: return "LAC"
        case .ravens: return "BAL"
        case .jaguars: return "JAC"
        case .broncos: return "DEN"
        case .bills: return "BUF"
        case .browns: return "CLE"
        case .colts: return "IND"
        case .falcons: return "ATL"
        case .lions: return "DET"
        case .rams: return "LAR"
        case .cowboys: return "DAL"
        case .vikings: return "MIN"
        case .patriots: return "NE"
        case .titans: return "TEN"
        case .texans: return "HOU"
        case .bucaneers: return "TB"
        case .forty: return "SF"
        case .cardinals: return "ARI"
        case .raiders: return "OAK"
        case .seahawks: return "SEA"
        case .redskins: return "WAS"
        }
    }
    
    static func teamType(for shortName: String) -> Team {
        return iterateEnum(Team.self).first(where: {$0.shortName == shortName})!
    }
}

func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

