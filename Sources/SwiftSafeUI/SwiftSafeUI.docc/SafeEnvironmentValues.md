# SafeEnvironmentValues

Ensures compatibility for `SwiftUI` environment values across different OS versions.

@Metadata {
    @PageColor(green)
    @TitleHeading("Catalog")
}


## Overview

**SafeEnvironmentValues** includes custom `SwiftUI` environment values within the **SwiftSafeUI** framework, specifically designed to ensure compatibility across various OS versions while reducing code duplication and minimizing technical debt.

By encapsulating necessary logic, **SafeEnvironmentValues** ensures that your app utilizes the latest available environment values while gracefully falling back to deprecated ones when required. This allows you to focus on building your app without worrying about the hassle of writing version-specific checks.


## Topics

- ``SwiftUICore/EnvironmentValues/safeDismiss``
- ``SwiftUICore/EnvironmentValues/safeIsPresented``
