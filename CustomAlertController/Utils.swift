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
        let vc = FLWAlertController.makeAlert(title: title, message: message, buttons: buttons)
        //UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
        UIApplication.shared.delegate?.window??.rootViewController?.present(vc, animated: true, completion: nil)
    }

   
}


protocol FLWAlertControls {
    func addButton(text: String, action: @escaping ()->Void) -> FLWCustomButton
}


class FLWAlertController: UIViewController, FLWAlertControls {
    
    static let nibName = "FLWAlertController"
    @IBOutlet weak var container: UIStackView!
    @IBOutlet var containerView: UIView!
    private var controls:[UIView] = [UIView]()
    
    
    convenience init() {
        self.init(nibName: FLWAlertController.nibName, bundle: Bundle.main)
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
            container.addArrangedSubview(control)
        }
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    
    
    static func makeAlert(title: String?, message: String?, buttons: [(String, (Void) -> Void)]?) -> FLWAlertController {
        let alert = FLWAlertController()
        
        for b in buttons ?? [("Ok", {})] {
            alert.addButton(text: b.0, action: {
                b.1()
            })
        }
        
        return alert
    }
    
    
    
    @discardableResult
    func addButton(text: String, action: @escaping () -> Void) -> FLWCustomButton {
        let button = FLWCustomButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        
        let buttonAction: () -> Void = {
            () in
            action()
            //self.dismiss(animated: true) {
            //    action()
            //}
        }
        
        button.action = buttonAction
        button.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.x, width: 100, height: 44)
        controls.append(button)
        return button
    }
}


