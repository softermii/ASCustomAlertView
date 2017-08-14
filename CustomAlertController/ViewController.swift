//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 6/16/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func createAlert() {
        showPopUpAction(text: "Text 1", message: "message", button: [AlertButton.okButton])
    }
    
    @IBAction func createAlert2() {
        let button  = AlertButton.okButton
        button.action = {
            debugPrint("Button 2 clicked")
        }
        showPopUpAction(text: "Text 2", message: "message2", button: [button])
    }

    
    func showPopUpAction(text: String, message: String? = nil, button: [AlertButton]) {
        presentPopUp(with: NSMutableAttributedString.h1(string: text), message: NSMutableAttributedString.m1(string: message), image: UIImage(named: "placeholder"), buttonsLayout: .horizontal, buttons: button)
    }


}
