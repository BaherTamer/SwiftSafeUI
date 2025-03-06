# SafeViews

Ensures compatibility for `SwiftUI` views across different iOS versions.

@Metadata {
    @PageColor(green)
    @TitleHeading("Catalog")
}


## Overview

**SafeViews** includes custom `SwiftUI` views within the **SwiftSafeUI** framework, specifically designed to ensure compatibility across various iOS versions while reducing code duplication and minimizing technical debt.

By encapsulating necessary logic, **SafeViews** ensures that your app utilizes the latest available views while gracefully falling back to deprecated ones when required. This allows you to focus on building your app without worrying about the hassle of writing version-specific checks.


***


## Views

* ``SafeNavigationView``
* ``SafeScrollView``
