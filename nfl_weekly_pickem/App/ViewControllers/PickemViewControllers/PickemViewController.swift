//
//  PickemViewController.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit
import Koloda
import SnapKit

class PickemViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource {
    
    var kolodaView: CustomKolodaView = CustomKolodaView()
    
    fileprivate let containerView = UIView()
    fileprivate let progressBarContainerView = UIView()
    fileprivate let progressBarView = UIView()
    fileprivate let gameInfoView = GameInfoViewContainer()
    fileprivate let feedBackGenerator = UINotificationFeedbackGenerator()
    fileprivate let awayButton = CircleButtonView()
    fileprivate let homeButton = CircleButtonView()
    
    fileprivate var dataSource: [Game]
    fileprivate var currentGame: Game? = nil
    
    fileprivate let mc: PickemModelController
    
    init(mc: PickemModelController) {
        self.mc = mc
        self.dataSource = mc.games
        super.init(nibName: nil, bundle: nil)
        currentGame = dataSource[0]
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pick em"
        kolodaView.dataSource = self
        kolodaView.delegate = self
        setUpView()
        setUpHandlers()
    }
    
    private func setUpView() {
        feedBackGenerator.prepare()
        
        view.addSubview(containerView)
        
        
        gameInfoView.game = dataSource[0]
        containerView.addSubview(gameInfoView)
        
        view.backgroundColor = .white
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints({ $0.edges.equalToSuperview() })

        containerView.addSubview(progressBarContainerView)
        containerView.addSubview(awayButton)
        containerView.addSubview(homeButton)
        containerView.addSubview(kolodaView)
        awayButton.backgroundColor = .white
        homeButton.backgroundColor = .white
    
        
        progressBarContainerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(64)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        progressBarContainerView.addSubview(progressBarView)
        progressBarView.backgroundColor = .nflSeaGreen
        
        progressBarView.snp.makeConstraints { (make) in
            make.width.top.equalTo(0)
            make.leading.bottom.equalTo(progressBarContainerView)
            make.height.equalTo(progressBarContainerView)
        }
        
        gameInfoView.snp.makeConstraints { (make) in
            make.top.equalTo(progressBarContainerView.snp.bottom).offset(25)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(90)
            make.centerX.equalToSuperview()
        }
        
        kolodaView.snp.makeConstraints { (make) in
            make.top.equalTo(gameInfoView.snp.bottom).offset(25)
            make.width.equalToSuperview()
            make.bottom.equalTo(awayButton.snp.top).offset(-45)
            make.centerX.equalToSuperview()
        }
        
        awayButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(56)
            make.centerX.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalToSuperview().offset(-45)
        }
        
        homeButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(56)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.bottom.equalToSuperview().offset(-45)
        }
    }
    
    fileprivate func setUpHandlers() {
        awayButton.handleTouch = { [weak self] in
            guard let `self` = self else { return }
            //self.animateBackgroundColorForTap()
            self.kolodaView.swipe(.left)
        }
        
        homeButton.handleTouch = { [weak self] in
            guard let `self` = self else { return }
            //self.animateBackgroundColorForTap()
            self.kolodaView.swipe(.right)
        }
    }
    
    fileprivate func updateProgressBar(for index: Int) {
        let width = (CGFloat(index + 1) / CGFloat(dataSource.count)) * progressBarContainerView.frame.width
        
        progressBarView.snp.updateConstraints { (make) in
            make.width.equalTo(width)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func animateBackgroundColorForTap() {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.containerView.backgroundColor = self?.currentGame?.homeTeam.primaryColor
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.containerView.backgroundColor = .white
            })
        }
    }
}

extension PickemViewController {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
        let vc = PickemEditViewController(mc: mc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("clicked card")
    }
}

extension PickemViewController {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = PickemKolodaView()
    
        let gameInfo = dataSource[index]
        view.game = gameInfo
        return view
    }
    
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        let game = dataSource[index]
        currentGame = game
        gameInfoView.game = game
    }
}

extension PickemViewController {
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        feedBackGenerator.notificationOccurred(.success)

        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.containerView.backgroundColor = .white
        }
        updateProgressBar(for: index)
        
        let game = dataSource[index]
        
        switch direction {
        case .left, .topLeft, .bottomLeft: mc.addPick(for: game, picked: game.awayTeam, homeOrAway: .away)
            
        case .right, .topRight, .bottomRight: mc.addPick(for: game, picked: game.homeTeam, homeOrAway: .home)
        default: return mc.addPick(for: game, picked: game.homeTeam, homeOrAway: .home)
        }
        
        
    }
    
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        if finishPercentage == 0.0 {
            containerView.backgroundColor = .white
        }
        
        let colorPercentage = finishPercentage / 100
        
        switch direction {
        case .left, .topLeft, .bottomLeft: containerView.backgroundColor = currentGame?.awayTeam.primaryColor.withAlphaComponent(colorPercentage)
        case .right, .topRight, .bottomRight: containerView.backgroundColor = currentGame?.homeTeam.primaryColor.withAlphaComponent(colorPercentage)
        default: containerView.backgroundColor = .white
        }

    }
    
    func kolodaDidResetCard(_ koloda: KolodaView) {
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.containerView.backgroundColor = .white
        }
    }
    
    func kolodaSwipeThresholdRatioMargin(_ koloda: KolodaView) -> CGFloat? {
        return 0.50
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil
    }
}


