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

private struct Layout {
    static let swipableInsets = UIEdgeInsets(top: 100, left: 100, bottom: -100, right: -100)
}

class PickemViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource {
    
    var kolodaView: KolodaView = KolodaView()
    fileprivate var dataSource: [Game] = GameGenerator.create()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(kolodaView)

        kolodaView.snp.makeConstraints { (make) in
            make.height.equalTo(500)
            make.width.equalTo(300)
            make.center.equalToSuperview()
        }
        view.backgroundColor = .white
    }
}

extension PickemViewController {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
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
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil
    }
}
