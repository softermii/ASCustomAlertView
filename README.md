## ASCustomAlertView

Custom animated alertViewcontroller with fade background mask

### Install:

~~~
pod 'ASCustomAlertView'
~~~

### Usage:
```swift

  showSuccessAlert(with: "title",
                         message: "message",
                         image: UIImage(named: "placeholder"),
                         style: .red,
                         buttons: [("Dismiss", {
                            self.dismissController(controller: self)
                         })
  ])
  ```

 ![Screenshot](https://media.giphy.com/media/l4FGJYIBoWHAP9XRm/giphy.gif)
 
 
 ### Author:
 Anton Stremovskiy
 
 ### Contacts:
 [@anton__dev](https://twitter.com/anton__dev)
