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
    fileprivate let feedBackGenerator = UINotificationFeedbackGenerator()
    
    fileprivate var dataSource: [Game] = GameGenerator.create()
    fileprivate var currentGame: Game? = nil
    
    fileprivate let mc: PickemModelController
    
    init(mc: PickemModelController) {
        self.mc = mc
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
    }
    
    private func setUpView() {
        feedBackGenerator.prepare()
        
        view.addSubview(containerView)
        containerView.addSubview(kolodaView)

        view.backgroundColor = .white
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints({ $0.edges.equalToSuperview() })
        
        kolodaView.snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
            make.center.equalToSuperview()
        }
        view.backgroundColor = .white
        
        setUpProgressBar()
    }
    
    private func setUpProgressBar() {
        containerView.addSubview(progressBarContainerView)
        
        progressBarContainerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        progressBarContainerView.addSubview(progressBarView)
        progressBarView.backgroundColor = .nflSeaGreen
        
        progressBarView.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.leading.top.bottom.equalTo(progressBarContainerView)
            make.height.equalTo(progressBarContainerView)
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
        currentGame = dataSource[index]
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
        
        var pick: Team {
            switch direction {
            case .left, .topLeft, .bottomLeft: return game.awayTeam
            case .right, .topRight, .bottomRight: return game.homeTeam
            default: return game.homeTeam
            }
        }
        
        mc.addPick(for: game, picked: pick)
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
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
//        print(currentSwipeDirection)
//        let game = dataSource[index]
//        switch currentSwipeDirection {
//        case .left, .topLeft, .bottomLeft: return PickemOverlayView(with: game.awayTeam)
//        case.right, .topRight, .bottomRight: return PickemOverlayView(with: game.homeTeam)
//        default: return nil
//        }
        return nil
    }
}


