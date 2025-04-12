![GitHub Cover](https://github.com/user-attachments/assets/7383a58d-fdf8-4a03-a1e0-1b3b1c811f22)

# SwiftSafeUI
**SwiftSafeUI** is a Swift package designed to streamline the management of deprecated SwiftUI APIs across OS versions. It provides a clean and efficient way to handle deprecation logic, ensuring your app always uses the latest APIs while seamlessly falling back to older, deprecated ones when necessary.

<br/>

### Why Deprecation Handling Matters?
As SwiftUI evolves with every release, Apple frequently introduces new APIs while deprecating older ones. Ignoring deprecated functionality can lead to accumulating technical debt, making your code harder to maintain and less adaptable to future changes. Without a proper strategy, version checks and workarounds can clutter your codebase, slowing down development and increasing the risk of bugs. Staying ahead of these changes ensures your app remains efficient, maintainable, and ready to leverage the latest SwiftUI improvements.

<br/>

### What SwiftSafeUI Solves?
**SwiftSafeUI** simplifies managing deprecated APIs in SwiftUI, providing a structured and efficient approach to handling version-specific UI changes across different OS versions. It helps you:

1. **Seamlessly handle deprecations:** Automatically uses the latest SwiftUI APIs while gracefully falling back to older alternatives when needed.
2. **Reduce boilerplate and complexity:** Eliminates the need for scattered version checks and conditional logic, centralizing compatibility handling.
3. **Future-proof your codebase:** Ensures your app remains adaptable as SwiftUI evolves, reducing manual maintenance and technical debt.
4. **Improve scalability and maintainability:** Keeps your UI code clean, structured, and responsive, regardless of the OS versions your app supports.
5. **Streamline SwiftUI development:** Provides safe modifiers, views, and environment values that abstract away compatibility concerns, allowing you to focus on building features.

<br/>

## ⚙️ Compatibility
- Swift 5.9+
- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+

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
        .upToNextMajor(from: "1.6.0")
    )
]
```

<br/>

## 📄 Documentation
For detailed usage examples, instructions, and tips, visit the [SwiftSafeUI Documentation](https://bahertamer.github.io/SwiftSafeUI/documentation/swiftsafeui/).

<br/>

## ⚖️ License
**SwiftSafeUI** is available under the `MIT` license. See the [LICENSE](LICENSE) file for more details.

<br/>

## ⭐️ Support
If this project has been helpful to you, consider giving it a star on GitHub! Your support encourages continued development and improvements. We appreciate it!

<br/>

<h3 align="center">Made with 💚</h3>
