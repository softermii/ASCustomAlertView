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
        
        //buton 1
        let button = AlertButton()
        button.setTitle("OK", for: .normal)
        button.action = {
            print("ok")
        }
        
        // button 2
        let button2 = AlertButton()
        button2.setTitle("DISMISS", for: .normal)
        button2.backgroundColor = UIColor.asCoral
        button.isDismissable = true
        
        showAlert(with: NSAttributedString(string: "Error"),
                         message: NSAttributedString(string: "This is error messages"),
                         image: UIImage(named: "placeholder"),
                         buttonsLayout: .horizontal,
                         buttons: [button, button2]
        )}
}

