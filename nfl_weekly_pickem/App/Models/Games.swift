//
//  Games.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/27/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation

class Games {
    let games: [Game]
    
    init(data: [String: Any]) {
        guard let allGames = data["data"] as? [[String: Any]] else {
            self.games = []
            return
        }
        
        var gameArr:[Game] = []
        
        allGames.forEach { (gameData) in
            gameArr.append(Game(json: gameData))
        }
        
        self.games = gameArr
    }
}
