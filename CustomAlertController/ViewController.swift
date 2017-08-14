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
        showPopUpAction(text: "This is Header", message: "alert message should be here", buttons: [AlertButton.okButton])
    }
    
    @IBAction func createAlert2() {
        let button  = AlertButton(title: "White Text", backColor: .asCoolBlueTwo, textColor: .asWhite)
        button.action = {
            debugPrint("Button 2 clicked")
        }
        showPopUpAction(text: "Header", message: "alert message should be here", buttons: [button])
    }

    
    func showPopUpAction(text: String, message: String? = nil, buttons: [AlertButton]) {
        presentPopUp(with: NSMutableAttributedString.h1(string: text), message: NSMutableAttributedString.m1(string: message), image: UIImage(named: "placeholder"), buttonsLayout: .horizontal, buttons: buttons)
    }


}
