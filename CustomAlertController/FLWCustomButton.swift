//
//  FLWCustomButton.swift
//  FloorWatch
//
//  Created by Anton Stremovskiy on 6/12/17.
//  Copyright © 2017 Softermii. All rights reserved.
//

import UIKit

class FLWCustomButton : UIButton {
    
    var action: (()->Void)?
    var text: String = "Ok"
    
    init() {
        super.init(frame:CGRect())
        localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    private func localInit() {
        self.setTitle(text, for: .normal)
        addTarget(self, action:#selector(FLWCustomButton.buttonTapped(_:)), for:.touchUpInside)
    }
    
    func buttonTapped(_ btn: FLWCustomButton) {
        if let action = action {
            action()
        }
    }


}
    

