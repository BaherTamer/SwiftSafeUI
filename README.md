![GitHub Cover](https://github.com/BaherTamer/SwiftSafeUI/assets/99125691/5d634f97-8819-4d79-94ac-403447107218)

# SwiftSafeUI
SwiftSafeUI is a SwiftUI package designed to handle deprecation issues and maintain compatibility across different iOS versions. By using custom modifiers, SwiftSafeUI provides a seamless way to apply UI changes without worrying about version-specific APIs.

<br/>

## 📝 Requirements
- iOS 14.0+

<br/>

## ⬇️ Installation
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
    .package(url: "https://github.com/BaherTamer/SwiftSafeUI.git", from: "1.0.0")
]
```
