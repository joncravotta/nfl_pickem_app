//
//  PickemOverlayView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit
import Koloda

class PickemOverlayView: OverlayView {
    
    lazy var overlayImageView: UIImageView! = {
        [unowned self] in
        
        var imageView = UIImageView(frame: self.bounds)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        return imageView
    }()
    
    private let teamLogo: UIImage
    
    init(with team: Team) {
        self.teamLogo = team.logo
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var overlayState: SwipeResultDirection? {
        didSet {
            guard let state = overlayState else { return }
            
            switch state {
                
            case .left, .right: overlayImageView.image = self.teamLogo
            default: overlayImageView.image = nil
         
            }
        }
    }
    
    
}
