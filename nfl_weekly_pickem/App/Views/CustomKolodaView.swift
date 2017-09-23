//
//  CustomKolodaView.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/23/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit
import Koloda

class CustomKolodaView: KolodaView {
    override func frameForCard(at index: Int) -> CGRect {
        let defaultBackgroundCardsTopMargin = -self.frame.height / 15
        let defaultBackgroundCardsScalePercent: CGFloat = 0.95
        
        let bottomOffset: CGFloat = 0
        let topOffset = defaultBackgroundCardsTopMargin * CGFloat(countOfVisibleCards - 1)
        let width = self.frame.width * pow(defaultBackgroundCardsScalePercent, CGFloat(index))
        let xOffset = (self.frame.width - width) / 2
        let height = (self.frame.height - bottomOffset - topOffset) * pow(defaultBackgroundCardsScalePercent, CGFloat(index)) + defaultBackgroundCardsTopMargin * 1.5
        let multiplier: CGFloat = index > 0 ? 1.0 : 0.0
        let prevCardFrame = index > 0 ? frameForCard(at: max(index - 1, 0)) : .zero
        let yOffset = (prevCardFrame.height - height + prevCardFrame.origin.y + defaultBackgroundCardsTopMargin) * multiplier
        print(yOffset)
        let frame = CGRect(x: xOffset, y: yOffset.magnitude, width: width, height: height)
        return frame
    }
}

