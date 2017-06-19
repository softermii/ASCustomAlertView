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
                            self.dismiss(animated: false, completion: {
                                
                                UIView.animate(withDuration: 0.3, animations: {
                                   // self.view.alpha = 0.3
                                }, completion: { (_) in
                                    self.view.backgroundColor = UIColor.white.withAlphaComponent(1)
                                })
                                
                            })
                         })
            ])
    }

}

