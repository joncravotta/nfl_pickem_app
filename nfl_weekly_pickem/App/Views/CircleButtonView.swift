//
//  CircleButtonView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/24/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class CircleButtonView: UIView {
    private let containerView = UIView()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    var handleTouch:(()->())? = nil
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        setShadow()
        layer.cornerRadius = 56/2
        addSubview(containerView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        
        containerView.addGestureRecognizer(gesture)
        
        containerView.layer.cornerRadius = 56/2
        containerView.clipsToBounds = true
        containerView.snp.makeConstraints{($0.edges.equalToSuperview())}
    }
    
    @objc func handleGesture() {
        UIView.animate(withDuration: 0.12,animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 0.12) {
                self.transform = CGAffineTransform.identity
            }
        })
        handleTouch?()
    }
}
