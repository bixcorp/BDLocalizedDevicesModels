# LocalizedDeviceModel
Apple product names localized.

![Xcode 11.0+](https://img.shields.io/badge/Xcode-11.0%2B-blue.svg)
![iOS 9.0+](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![tvOS 9.0+](https://img.shields.io/badge/tvOS-9.0%2B-blue.svg)
![watchOS 5.0+](https://img.shields.io/badge/watchOS-5.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)


## Usage
Note: To use a localization included in the package, the app using the package must support this localization.
### Localized product name
Swift
```swift
UIDevice.current.localizedProductName
```

Objective-C
```objc
[UIDevice currentDevice].localizedProductName;
```

### English product name
Swift
```swift
UIDevice.current.productName
```

Objective-C
```objc
[UIDevice currentDevice].productName;
```
