## ASCustomAlertView

Custom animated alertViewcontroller with fade background animation and custom buttons

Supports iOS 9 and later

![Swift 3.0](https://img.shields.io/badge/Swift-3.0-green.svg?style=flat)

### Install:

~~~
pod 'ASCustomAlertView'
~~~

### Usage:
 ```swift
 
    @IBAction func createAlert() {
        showPopUpAction(text: "This is Header", message: "alert message should be here", buttons: [AlertButton.okButton])
    }
    
    @IBAction func createAlert2() {
        let button = AlertButton(title: "White Text", backColor: .asCoolBlueTwo, textColor: .asWhite)
        button.action = {
            debugPrint("Button 2 clicked")
        }
        showPopUpAction(text: "Header", message: "alert message should be here", buttons: [button])
    }

    
    func showPopUpAction(text: String, message: String? = nil, buttons: [AlertButton]) {
        presentPopUp(with: NSMutableAttributedString.h1(string: text), message: NSMutableAttributedString.m1(string: message), image: UIImage(named: "placeholder"), buttonsLayout: .horizontal, buttons: buttons)
    }

 ```

 ![Screenshot](https://media.giphy.com/media/l0IyeBxbmtcsKIZmU/giphy.gif)
 
 
 ### TODO:
 
 - [ ] Custom Animations
 

 #### Author:
 Anton Stremovskiy
 
 #### Contacts:
 [@anton__dev](https://twitter.com/anton__dev)
