# SafeModifiers

Provides a reliable way to use `SwiftUI` modifiers that ensure compatibility across different iOS versions.


## Overview
**SafeModifiers** are custom `SwiftUI` modifiers included in the **SwiftSafeUI** package, designed to help developers manage deprecation issues and maintain compatibility across various iOS versions. These modifiers encapsulate the necessary logic to apply UI changes while ensuring your app utilizes the latest methods and gracefully falls back to deprecated ones when needed. By using **SafeModifiers**, you can create a seamless and consistent user interface without worrying about version-specific APIs.


***


## Modifiers

### Appearance Modifiers

- ``SwiftUICore/View/safeBackground(alignment:content:)``
- ``SwiftUICore/View/safeForegroundColor(_:)``
- ``SwiftUICore/View/safeOverlay(alignment:content:)``
- ``SwiftUICore/View/safeTintColor(_:)``

### Auxiliary View Modifiers

- ``SwiftUICore/View/safeNavBarHidden(_:)``
- ``SwiftUICore/View/safeNavBarTitle(_:displayMode:)``

### Drawing & Graphics

- ``SwiftUICore/View/safeMask(alignment:_:)``

### Input & Event Modifiers

- ``SwiftUICore/View/safeOnChange(_:perform:)``

### Layout Modifiers

- ``SwiftUICore/View/safeIgnoreSafeArea(_:)``

### Text & Symbol Modifiers

- ``SwiftUICore/View/safeAutocapitalization(_:)``
- ``SwiftUICore/View/safeLineLimit(_:reservesSpace:)``
