## ASCustomAlertView

Custom animated alertViewcontroller with fade background mask and custom buttons

### Install:

~~~
pod 'ASCustomAlertView'
~~~

### Usage:
 ```swift
 
    @IBAction func createAlert() {
        
        // buton 1
        let button = AlertButton()
        button.setTitle("OK", for: .normal)
        button.action = {
            print("ok")
        }
        // button 2
        let button2 = AlertButton()
        button2.setTitle("DISMISS", for: .normal)
        button2.backgroundColor = UIColor.asCoral
        
        showAlert(with: "Error",
                         message: "This is error message",
                         image: UIImage(named: "placeholder"),
                         buttonsLayout: .horizontal,
                         buttons: [button, button2]
        )}
 ```

 ![Screenshot](https://media.giphy.com/media/l0IyeBxbmtcsKIZmU/giphy.gif)
 
 
 ### Todo:
 
 - [ ] Custom Animations
 

 #### Author:
 Anton Stremovskiy
 
 #### Contacts:
 [@anton__dev](https://twitter.com/anton__dev)
