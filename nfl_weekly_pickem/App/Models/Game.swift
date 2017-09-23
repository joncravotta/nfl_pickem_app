//
//  Game.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation


class Game {
    let awayTeam: Team
    let homeTeam: Team
    
    let awayTeamStat: TeamStat
    let homeTeamStat: TeamStat
    
    let gameInfo: GameInfo
    
    init(awayTeam: Team, homeTeam: Team, awayTeamStat: TeamStat, homeTeamStat: TeamStat, gameInfo: GameInfo) {
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
        
        self.awayTeamStat = awayTeamStat
        self.homeTeamStat = homeTeamStat
        
        self.gameInfo = gameInfo
    }
}

class GameGenerator {
    static func create() -> [Game] {
        // one
        let giantStats = TeamStat(spread: "+6", record: "0-2", recordATS: "0-2", lastTenRecord: "0-2")
        let eagleStats = TeamStat(spread: "-6", record: "1-1", recordATS: "1-1", lastTenRecord: "1-1")
        let gameInfo1 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "N.Y Giants at Philadelphia")
        let game1 = Game(awayTeam: .giants, homeTeam: .eagles, awayTeamStat: giantStats, homeTeamStat: eagleStats, gameInfo: gameInfo1)
        
        // two
        let noStats = TeamStat(spread: "-5.5", record: "0-2", recordATS: "0-2", lastTenRecord: "0-2")
        let pantherStats = TeamStat(spread: "+5.5", record: "2-1", recordATS: "1-1", lastTenRecord: "2-0")
        let gameInfo2 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "New Orleans at Carolina")
        let game2 = Game(awayTeam: .saints, homeTeam: .panthers, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo2)
        
        return [game1, game2]
        
    }
}
