//
//  TabBarController.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpView() {
        let vc1 = UIViewController()
        vc1.tabBarItem = UITabBarItem(title: "one", image: nil, tag: 0)
        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: "two", image: nil, tag: 1)
        
        self.viewControllers = [vc1, vc2]
    }
    
}
