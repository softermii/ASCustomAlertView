//
//  ViewController.swift
//  CustomAlertController
//
//  Created by Anton Stremovskiy on 6/16/17.
//  Copyright © 2017 áSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
   @IBAction func createAlert() {
        showSuccessAlert(with: "title",
                         message: "message",
                         buttons: [("dismiss", {
                            self.dismissController(controller: self)
                         })
        ])
    }

}

