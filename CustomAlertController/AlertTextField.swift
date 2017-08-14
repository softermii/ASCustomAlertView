//
//  AlertTextField.swift
//  FloorWatch
//
//  Created by Anton Stremovskiy on 7/3/17.
//  Copyright © 2017 Softermii. All rights reserved.
//

import UIKit

enum TextFieldType {
    case text
    case password
    case email
}


class AlertTextField: TextField {
    
    var action: ((_ text: String) -> Void)? = nil


    init(background: UIColor = .clear, placeholder: String = "Placeholder", textFieldType: typeTextField = .text) {
        super.init(frame:.zero)
        localInit(background: background, placeholder: placeholder, textFieldType: textFieldType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder:aDecoder )
        localInit()
    }
    
    private func localInit(background: UIColor = .clear, placeholder: String = "Placeholder", textFieldType: typeTextField = .text) {
        clearsOnBeginEditing   = true
        delegate               = self
        autocorrectionType     = .no
        autocapitalizationType = .none
        font                   = .m3Font()
        typeField              = textFieldType
        attributedPlaceholder  = NSMutableAttributedString.p1(string: placeholder)
        backgroundColor        = background
        addTarget(self, action:#selector(AlertTextField.onTextChange(_:)), for: .editingDidEnd)
        setBottomBorder()
        
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        validate()
    }
    
    
    @objc fileprivate func onTextChange(_ txt: AlertTextField) {
        action?(txt.text!)
    }
}

extension AlertTextField {
    
    func setBottomBorder(color: UIColor = .lightGray) {
        borderStyle           = .none
        layer.masksToBounds   = false
        layer.shadowColor     = color.cgColor
        layer.shadowOffset    = CGSize(width: 0.0, height: 0.5)
        layer.shadowOpacity   = 1.0
        layer.shadowRadius    = 0.0
    }
}


