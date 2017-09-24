//
//  GameInfoView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/24/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class GameInfoViewContainer: UIView {
    
    private let infoView = PickemGameInfoView()
    private let containerView = UIView()
    
    var game: Game? = nil {
        didSet {
            guard let game = game else { return }
            infoView.gameTitleString = game.gameInfo.gameTitle
            infoView.timeLabelString = game.gameInfo.gameTime
        }
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        setShadow()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true

        addSubview(containerView)
        containerView.addSubview(infoView)
        
        containerView.snp.makeConstraints{($0.edges.equalToSuperview())}
        infoView.snp.makeConstraints{($0.edges.equalToSuperview())}
    }
}
