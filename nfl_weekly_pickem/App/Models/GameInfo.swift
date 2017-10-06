//
//  GameInfo.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation

struct GameInfo {
    let gameTime: String
    let gameTitle: String
    let gameDate: String
    
    init(json: [String: Any]) {
        gameTime = json["game_time_formatted"] as! String
        gameTitle = json["game_title"] as! String
        gameDate = json["game_date_formatted"] as! String
    }
}
