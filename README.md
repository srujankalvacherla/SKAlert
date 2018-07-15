# SKAlert

Alerts in iOS might be painful when it comes to writing multiple lines of code and has reusabilty issues. For that matter we have created `SKAlert` for simpler usage of alerts for iOS.

## Requirements

`SKAlert` works for iOS 9.0+ and requires ARC to buid.

## Add SKAlert to your project

### Cocoapods ( Highly recommended way is to use cocoapods)
`pod 'SKAlert'`

### Static library

Follow this article at[Medium](https://medium.com/@nishantnitb/writing-custom-universal-framework-in-xcode-9-and-ios-11-7a63a2ce024a)
Before continuing with the above article, delete Example project.

### Usage:

1. import SKAlert
2. Start Using It, by below sytax
```swift
_  = SKAlert().showAlert("Plain Alert Header.", subTitle: "Plain Alert Sub Title")
```
```swift
_  = SKAlert().showAlertWithOkAction("Alert Header", subTitle: "Alert Sub Title", okCompletionHandler: {
print("Ok Pressed")
})
```
```swift
_  = SKAlert().showAlertWithTwoButtons("Alert Header With Two Buttons", subTitle: "Alert Sub Title With Two Buttons", okCompletionHandler: {
print("Ok Pressed")
}, cancelCompletionHandler: {
print("Canel Pressed")
})
```
```swift
_ = SKAlert().showAlertWithCustomButtons("Alert Header With Two Custom Buttons", subTitle: "Sub title with custom buttons with Handlers........!!!", leftBtnTitle: "Left", leftBtnColor: UIColor.black, rightBtnTitle: "right", rightBtnColor: UIColor.red, leftCompletionHandler: {
print("left")
}) {
print("right")
}
```
```swift
let alert = SKAlert()
alert.isTapToDismiss = false
alert.showAlert("Plain Alert Header.", subTitle: "Plain Alert Sub Title")
```

### Noticeable mentions

1. SweetAlert
2. Medium [article](https://medium.com/flawless-app-stories/getting-started-with-reusable-frameworks-for-ios-development-f00d74827d11)
## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each release can be found in the [CHANGELOG](CHANGELOG.md). 
