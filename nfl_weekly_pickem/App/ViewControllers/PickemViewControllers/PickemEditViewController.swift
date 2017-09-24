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
    fileprivate let mc: PickemModelController
    
    init(mc: PickemModelController) {
        self.mc = mc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PickemEditTableViewCell.self, forCellReuseIdentifier: "PickemEditTableViewCell")
        
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(tableView)
        view.addSubview(bottomBar)
        bottomBar.backgroundColor = .nflDarkGray
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomBar.snp.top)
        }
        
        bottomBar.snp.makeConstraints { (make) in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-49)
        }
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
        cell.game = mc.picks[indexPath.row].game
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}


