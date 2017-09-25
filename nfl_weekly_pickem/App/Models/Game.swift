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
        let giantStats = TeamStat(spread: "+6", record: "0-2 (0 - 1 Road)", recordATS: "0-2 (0 - 1 Road)", lastTenRecord: "0-2 (0 - 2 ATS)")
        let eagleStats = TeamStat(spread: "-6", record: "1-1 (0 - 0 Home)", recordATS: "1-1 (0 - 0 Home)", lastTenRecord: "1-1 (1 - 1 ATS)")
        let gameInfo1 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "N.Y Giants at Philadelphia")
        let game1 = Game(awayTeam: .giants, homeTeam: .eagles, awayTeamStat: giantStats, homeTeamStat: eagleStats, gameInfo: gameInfo1)
        
        // two
        let noStats = TeamStat(spread: "-5.5", record: "0-2 (0 - 1 Road)", recordATS: "0-2 (0 - 1 Road)", lastTenRecord: "0-2 (0 - 2 ATS)")
        let pantherStats = TeamStat(spread: "+5.5", record: "2-0 (1 - 0 Home)", recordATS: "1-1 (0 - 1 Home)", lastTenRecord: "2-0 (1 - 1 ATS)")
        let gameInfo2 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "New Orleans at Carolina")
        let game2 = Game(awayTeam: .saints, homeTeam: .panthers, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo2)
        
        // three
        let gameInfo3 = GameInfo(gameTime: "1:00 PM ET", gameTitle: " Pittsburgh at Chicago")
        let game3 = Game(awayTeam: .steelers, homeTeam: .bears, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo3)
        
        // four
        let gameInfo4 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "Miami at N.Y. Jets")
        let game4 = Game(awayTeam: .doliphins, homeTeam: .jets, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo4)
        
        // five
        let gameInfo5 = GameInfo(gameTime: "4:25 PM ET", gameTitle: "Cincinnati at Green Bay")
        let game5 = Game(awayTeam: .bengals, homeTeam: .packers, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo5)
        
        // six
        let gameInfo6 = GameInfo(gameTime: "4:25 PM ET", gameTitle: "Kansas City at L.A. Chargers")
        let game6 = Game(awayTeam: .chiefs, homeTeam: .chargers, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo6)
        
        //seven
        let gameInfo7 = GameInfo(gameTime: "9:25 PM ET", gameTitle: " Baltimore vs Jacksonville")
        let game7 = Game(awayTeam: .ravens, homeTeam: .jaguars, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo7)
        
        //eight
        let gameInfo8 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "Denver at Buffalo")
        let game8 = Game(awayTeam: .broncos, homeTeam: .bills, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo8)
        
        //nine
        let gameInfo9 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "Cleveland at Indianapolis")
        let game9 = Game(awayTeam: .browns, homeTeam: .colts, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo9)
        
        //nine
        let gameInfo10 = GameInfo(gameTime: "1:00 PM ET", gameTitle: "Atlanta at Detroit")
        let game10 = Game(awayTeam: .falcons, homeTeam: .lions, awayTeamStat: noStats, homeTeamStat: pantherStats, gameInfo: gameInfo10)
        
        return [game1, game2, game3, game4, game5, game6, game7, game8, game9, game10]
        
    }
}
