//
//  PickemModelController.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation



class PickemModelController {
    var picks:[Pick] = []
    
    init() {
        
    }
    
    func addPick(for game: Game, picked team: Team, homeOrAway: HomeOrAway) {
        picks.append(Pick(game: game, team: team, homeOrAway: homeOrAway))
    }
}
