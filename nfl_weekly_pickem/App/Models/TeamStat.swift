//
//  TeamStat.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation

struct TeamStat {
    let spread: String
    let record: String
    let recordATS: String
    let lastTenRecord: String
    
    init(json: [String: Any]) {
        self.spread = json["team_odds"] as! String
        self.record = json["team_record_overall"] as! String
        self.recordATS = json["team_record_ats_overall"] as! String
        self.lastTenRecord = json["team_record_L10_overall"] as! String
    }
}

