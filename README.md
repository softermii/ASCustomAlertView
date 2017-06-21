## ASCustomAlertView

Custom animated alertViewcontroller with fade background mask

### Install:

~~~
pod 'ASCustomAlertView'
~~~

### Usage:
```swift
       showErrorAlert(with: "Error",
                      message: "This is error message",
                      image: UIImage(named: "placeholder"),
                      buttons: [("OK", {
                          self.dismissController(controller: self)
                      })
        ])
    }
 ```
 
 
 ```swift
 
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

     showSuccessAlert(with: "Success",
                      message: "This is success message",
                      image: UIImage(named: "placeholder"),
                      buttons: [button, button2]
        )
    }

 ```

 ![Screenshot](https://media.giphy.com/media/l0IyeBxbmtcsKIZmU/giphy.gif)
 
 
 ### Author:
 Anton Stremovskiy
 
 ### Contacts:
 [@anton__dev](https://twitter.com/anton__dev)
