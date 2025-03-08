# ``SwiftSafeUI``

Encapsulates deprecation handling logic, ensuring compatibility across different OS versions.

@Metadata {
    @PageImage(purpose: icon, source: "SwiftSafeUI-Icon", alt: "A technology icon representing the SwiftSafeUI framework.")
    @PageColor(green)
    @Available(iOS, introduced: "13.0")
}


## Overview

**SwiftSafeUI** is a `SwiftUI` framework that streamlines the management of deprecated APIs, providing an elegant solution to handle version-specific UI changes across different OS versions. By abstracting deprecation handling, **SwiftSafeUI** allows developers to focus on building features without worrying about maintaining compatibility with older OS versions.

As `SwiftUI` evolves, Apple introduces new APIs while phasing out older ones. With **SwiftSafeUI**, you can easily manage these changes. The framework ensures that your app always utilizes the most up-to-date methods, views, and envirnoment values, gracefully falling back on deprecated alternatives when needed. This approach minimizes the need for version checks, conditional logic, and manual maintenance, saving you time and reducing technical debt.

By centralizing your deprecation handling logic, **SwiftSafeUI** reduces boilerplate code, while keeping your app adaptable to new `SwiftUI` features. With safe modifiers, views, and environment values, **SwiftSafeUI** empowers you to create consistent, responsive, and future-proof interfaces. It abstracts away complex compatibility concerns, making your `SwiftUI` development smoother and more efficient, regardless of the OS version your app supports.

By using **SwiftSafeUI**, you can confidently navigate the challenges of evolving APIs, ensuring that your app remains maintainable, scalable, and adaptable to future updates.


## Topics

### Essentials

- <doc:SafeEnvironmentValues>
- <doc:SafeModifiers>
- <doc:SafeViews>
