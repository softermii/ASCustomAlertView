//
//  RatingView.swift
//  FloorWatch
//
//  Created by Anton Stremovskiy on 7/4/17.
//  Copyright © 2017 Softermii. All rights reserved.
//

import UIKit
import Cosmos


class RatingView: CosmosView {
    
    var action: ((_ rate: Double) -> Void)? = nil
   
    init(rateText: String = "", rate: Double = 0.0) {
        super.init(frame: .zero)
        localInit(rateText: rateText, rate: rate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    func setupRating() {
        settings.filledColor = .asMacaroniAndCheese
        settings.updateOnTouch = true
        settings.fillMode = .full
        settings.starSize = 25
        settings.starMargin = 5
        settings.textFont = .m2Font()
        settings.minTouchRating = 0
        settings.emptyBorderColor = .asMacaroniAndCheese
    }

    
    func setupTouch() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(RatingView.didFinishedRate))
        addGestureRecognizer(touch)
    }
    
    private func localInit(rateText: String = "", rate: Double = 0.0) {
        text = rateText
        rating = rate
        setupRating()
        setupTouch()
    }
    
    func didFinishedRate() {
        action?(rating)
    }
  
}
