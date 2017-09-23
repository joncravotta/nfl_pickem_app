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
            make.width.centerX.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

extension PickemEditViewController: UITableViewDelegate {
    
}

extension PickemEditViewController: UITableViewDataSource {
    
}
