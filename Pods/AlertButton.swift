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

    static public var backColor           = UIColor.clear
    static public var isDismissable: Bool = true
    
    public static var okButton: AlertButton = {
        let button = AlertButton(title: "OK")
        button.action = nil
        return button
    }()
    
    public static var cancelButton: AlertButton = {
        let button = AlertButton(title: "Cancel")
        button.action = nil
        return button
    }()

    init(title: String = "OK") {
        super.init(frame:.zero)
        localInit(title: title)
    }
    
    convenience init(title: String? = "OK", backColor: UIColor? = AlertButton.backColor, textColor: UIColor? = .white) {
        self.init()
        backgroundColor = backColor
        setAttributedTitle(NSMutableAttributedString.b2(string: title), for: .normal)
        actionInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    private func actionInit() {
        addTarget(self, action:#selector(AlertButton.buttonTapped(_:)), for:.touchUpInside)
    }

    
    private func localInit(title: String = "OK") {
        backgroundColor = AlertButton.backColor
        setAttributedTitle(NSMutableAttributedString.b1(string: title), for: .normal)
        addTarget(self, action:#selector(AlertButton.buttonTapped(_:)), for:.touchUpInside)
    }
    
    @objc fileprivate func buttonTapped(_ btn: AlertButton) {
        if AlertButton.isDismissable || action == nil {
           closeAction?()
        }

        action?()
    }
}

