# SafeEnvironmentValues

Provides a reliable way to use `SwiftUI` environment values that ensure compatibility across different iOS versions.

@Metadata {
    @PageColor(green)
}


## Overview
**SafeEnvironmentValues** are custom `SwiftUI` environment values included in the **SwiftSafeUI** package, designed to help developers manage deprecation issues and maintain compatibility across various iOS versions. 

These environment values encapsulate the necessary logic to apply UI changes while ensuring your app utilizes the latest methods and gracefully falls back to deprecated ones when needed.

By using **SafeEnvironmentValues**, you can create a seamless and consistent user interface without worrying about version-specific APIs.


***


## EnvironmentValues

- ``SwiftUICore/EnvironmentValues/safeDismiss``
- ``SwiftUICore/EnvironmentValues/safeIsPresented``
