//
//  PickemEditViewController.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class PickemEditViewController: UIViewController {
    fileprivate let tableView = UITableView()
    fileprivate let bottomBar = UIView()
    fileprivate let bottomBarLabel = UILabel()
    fileprivate let mc: PickemModelController
    fileprivate let feedBackGenerator = UINotificationFeedbackGenerator()
    
    init(mc: PickemModelController) {
        self.mc = mc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Picks"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 20, 0)
        
        tableView.register(PickemEditTableViewCell.self, forCellReuseIdentifier: "PickemEditTableViewCell")
        setUpView()
    }
    
    private func setUpView() {
        feedBackGenerator.prepare()
        view.addSubview(tableView)
        view.addSubview(bottomBar)
        bottomBar.backgroundColor = .nflDarkGray
        
        bottomBar.addSubview(bottomBarLabel)
        bottomBarLabel.textColor = .white
        bottomBarLabel.text = "SUBMIT"
        bottomBarLabel.font = UIFont.font(withType: .bold, withSize: 18)
        bottomBarLabel.textAlignment = .center
        
        let bottomBarGesture = UITapGestureRecognizer(target: self, action: #selector(submit))
        bottomBar.addGestureRecognizer(bottomBarGesture)
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomBar.snp.top)
        }
        
        bottomBar.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-49)
        }
        
        bottomBarLabel.snp.makeConstraints { (make) in
            make.edges.centerX.equalToSuperview()
        }
    }
    
    func submit() {
        feedBackGenerator.notificationOccurred(.success)
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

extension PickemEditViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mc.picks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PickemEditTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PickemEditTableViewCell") as! PickemEditTableViewCell
        cell.pick = mc.picks[indexPath.row]
        
        cell.didChangePick = { [weak self] (pick) in
            self?.mc.picks[indexPath.row] = pick
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


