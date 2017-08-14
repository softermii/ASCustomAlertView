//
//  TextField.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 8/14/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import UIKit

public enum typeTextField {
    case email
    case password
    case text
}

public enum validationStatus {
    case wrongEmail
    case wrongPassword
    case emptyField
    case success
}

public class TextField: UITextField, UITextFieldDelegate {
    
    var colorPlace = UIColor.red
    var textPlace: String?
    var lineWidth: CGFloat?
    
    var typeField: typeTextField = .text {
        didSet {
            switch typeField {
            case .email:
                keyboardType = .emailAddress
                isSecureTextEntry = false
            case .password:
                keyboardType = .default
                isSecureTextEntry = true
            default:
                keyboardType = .default
                isSecureTextEntry = false
            }
        }
    }
    
    override public func draw(_ rect: CGRect) {
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = lineWidth ?? 3.0
        tintColor.setStroke()
        path.stroke()
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    func showError() {
        delegate = self
        self.shake()
    }
    
    @discardableResult
    func validate() -> validationStatus {
        switch typeField {
        case .email:
            if (!isEmailValid()) {
                showError()
                return .wrongEmail
            } else {
                return .success
            }
        case .password:
            if (!isPasswordValid()) {
                showError()
                return .wrongPassword
            } else {
                return .success
            }
        case .text:
            if (text?.isEmpty == true) {
                showError()
                return .emptyField
            } else {
                return .success
            }
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.validate()
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    // MARK: - Input Data Validation Logic
    
    func isEmailValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
    
    func isPasswordValid() -> Bool {
        guard let text = text else { return false }
        return !text.isEmpty && text.characters.count >= 6
    }
    
}
