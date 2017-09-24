//
//  Pick.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
enum HomeOrAway {
    case home
    case away
}

struct Pick {
    let game: Game
    let team: Team
    let homeOrAway: HomeOrAway
}
