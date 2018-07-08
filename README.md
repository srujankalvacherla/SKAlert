# SKAlert

Alerts in iOS might be painful when it comes to writing multiple lines of code and reusabilty issues. For that matter we have created `SKAlert` for simpler usage of alerts for iOS.

## Requirements

`SKAlert` works for iOS 9.0+ and requires ARC to buid.

## Add SKAlert to your project

### Cocoapods

`pod 'SKAlert'`

### Static library

1. Download Repo
2. Import SKAlert.framework into your project. Don't forget click "copy items if needed", and add to your targets.
3. Add the same in Project Settings -> Embedded Binaries.

### Usage:

1. import SKAlert
2. Start Using It, by below sytax
```swift
_ = SKAlert().showAlert("Header.", subTitle: "Sub Title")
```

### Noticeable mentions

1. SweetAlert
2. Medium [article](https://medium.com/flawless-app-stories/getting-started-with-reusable-frameworks-for-ios-development-f00d74827d11)
## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).




