//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 6/16/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton!
    var button2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton()
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(ViewController.onTap), for: .touchUpInside)
        button.backgroundColor = UIColor.asOffBlue
        
        button2 = UIButton()
        button2.setTitle("Dismiss", for: .normal)
        button2.addTarget(self, action: #selector(ViewController.onCancel), for: .touchUpInside)
        button2.backgroundColor = UIColor.asCoral
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func onTap() {
        print("clicked")
    }
    
    func onCancel() {
        self.dismissController(controller: self)
    }
    
    
   @IBAction func createAlert() {
        showErrorAlert(with: "Error",
                         message: "This is error message",
                         image: UIImage(named: "placeholder"),
                         buttonsLayout: .horizontal, animated: true,
                         buttons: [("OK", {
                            self.dismissController(controller: self)
                         })
        ])
    }
    
    
    @IBAction func createSuccessAlert() {
        showSuccessAlert(with: "Success",
                         message: "This is success message",
                         image: UIImage(named: "placeholder"), animated: false,
                         buttonsLayout: .vertical,
                         buttons: [button, button2]
        )
    }

}

