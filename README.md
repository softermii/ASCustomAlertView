## ASCustomAlertView

Custom animated alertViewcontroller with fade background mask

### Install:

pod 'ASCustomAlertView'

### Usage:
~~~
  self.showSuccessAlert(with: "title", message: "message", buttons: [("button title", { 
      self.dismissController(controller: self) 
    })
  ])
