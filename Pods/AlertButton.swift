//
//  FLWCustomButton.swift
//  FloorWatch
//
//  Created by Anton Stremovskiy on 6/12/17.
//  Copyright © 2017 Softermii. All rights reserved.
//

import UIKit

class AlertButton : UIButton {
    var action: (() -> Void)?
    var text: String = "Ok"
    
    init() {
        super.init(frame:.zero)
        localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    public func setup(with title: String) {
        setTitle(text, for: .normal)
    }
    
    private func localInit() {
        addTarget(self, action:#selector(AlertButton.buttonTapped(_:)), for:.touchUpInside)
    }
    
    @objc fileprivate func buttonTapped(_ btn: AlertButton) {
        action?()
    }
}
    

