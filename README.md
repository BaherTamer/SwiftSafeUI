![GitHub Cover](https://github.com/BaherTamer/SwiftSafeUI/assets/99125691/5d634f97-8819-4d79-94ac-403447107218)

# SwiftSafeUI
**SwiftSafeUI** is a Swift package that simplifies managing deprecated SwiftUI APIs across different iOS versions. It encapsulates deprecation handling logic, ensuring that your app always utilizes the latest available methods & views while gracefully falling back to older deprecated ones when needed. This way, you can maintain compatibility across iOS versions.

<br/>

## 📝 Requirements
- Swift 5.10+
- iOS 13.0+

<br/>

## 🔩 Installation
#### 🔨 For Xcode Projects
1. In Xcode, select **Add Packages** from the File menu.
2. Enter `https://github.com/BaherTamer/SwiftSafeUI` in the search field.
3. Click **Add Package** (Set the Dependency Rule to Up to Next Major Version)
4. After adding the package, you will be able to import **SwiftSafeUI** in your project by using.

``` swift
import SwiftSafeUI
```

<br/>

#### 📦 For Swift Packages
Add a dependency in your `Package.swift`

``` swift
dependencies: [
    .package(
        url: "https://github.com/BaherTamer/SwiftSafeUI.git",
        .upToNextMajor(from: "1.3.0")
    )
]
```

<br/>

## 📄 Documentation
Check out the [SwiftSafeUI Documentation](https://bahertamer.github.io/SwiftSafeUI/documentation/swiftsafeui/) for usage examples and instructions.

<br/>

## ⚖️ License
**SwiftSafeUI** is available under the `MIT` license. See the [LICENSE](LICENSE) file for more details.

<br/>

<h3 align="center">Made with 💚</h3>
