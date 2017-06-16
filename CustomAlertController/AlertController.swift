//
//  Utils.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 6/16/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showSuccessAlert(with title: String, message: String, buttons: [(String, (Void) -> Void)]?) {
        let vc = AlertController.makeAlert(title: title, message: message, buttons: buttons)
        self.present(vc, animated: true, completion: nil)
    }
   
}

class AlertController: UIViewController {
    @IBOutlet weak var buttonsStack: UIStackView!
    @IBOutlet var containerView: UIView!
    
    private var controls:[UIView] = [UIView]()
    
    convenience init() {
        self.init(nibName: String.init(describing: AlertController.self), bundle: Bundle.main)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    override func loadView() {
        super.loadView()
        internalLoadViews()
    }
    
    private func internalLoadViews() {
        self.containerView.clipsToBounds = true
        
        for control in controls {
            buttonsStack.addArrangedSubview(control)
        }
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    static public func makeAlert(title: String?, message: String?, buttons: [(String, (Void) -> Void)]?) -> AlertController {
        let alert = AlertController()
        
        guard let b = buttons else { return alert }
        b.forEach { alert.controls.append(getButton(text: $0.0, action: $0.1)) }
        
        return alert
    }
    
    @discardableResult
    static func getButton(text: String, action: @escaping () -> Void) -> AlertButton {
        let button = AlertButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.action = action
        button.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.x, width: 100, height: 44)
        button.setNeedsLayout()
        button.layoutIfNeeded()
        
        return button
    }
}


