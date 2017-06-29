//
//  FLWCustomButton.swift
//  FloorWatch
//
//  Created by Anton Stremovskiy on 6/12/17.
//  Copyright © 2017 Softermii. All rights reserved.
//

import UIKit


class AlertButton : UIButton {
    
    var action: (() -> Void)? = nil
    var closeAction: (() -> Void)?

    public var backColor           = UIColor.asCoolBlue
    public var isDismissable: Bool = true
    
    init() {
        super.init(frame:.zero)
        localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    private func localInit() {
        backgroundColor = backColor
        addTarget(self, action:#selector(AlertButton.buttonTapped(_:)), for:.touchUpInside)
    }
    
    @objc fileprivate func buttonTapped(_ btn: AlertButton) {
        if isDismissable || action == nil {
           closeAction?()
        }
        
        action?()
    }
}
    

