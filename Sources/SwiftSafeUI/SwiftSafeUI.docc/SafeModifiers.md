# SafeModifiers

Provides a reliable way to use `SwiftUI` modifiers that ensure compatibility across different iOS versions.

@Metadata {
    @PageColor(green)
}


## Overview
**SafeModifiers** are custom `SwiftUI` modifiers included in the **SwiftSafeUI** package, designed to help developers manage deprecation issues and maintain compatibility across various iOS versions. 

These modifiers encapsulate the necessary logic to apply UI changes while ensuring your app utilizes the latest methods and gracefully falls back to deprecated ones when needed.

By using **SafeModifiers**, you can create a seamless and consistent user interface without worrying about version-specific APIs.


***


## Modifiers

### Accessibility Modifiers

- ``SwiftUICore/View/safeAccessibilityActivationPoint(_:)``
- ``SwiftUICore/View/safeAccessibilityAddTraits(_:)``
- ``SwiftUICore/View/safeAccessibilityHidden(_:)``
- ``SwiftUICore/View/safeAccessibilityHint(_:)``
- ``SwiftUICore/View/safeAccessibilityIdentifier(_:)``
- ``SwiftUICore/View/safeAccessibilityInputLabels(_:)``
- ``SwiftUICore/View/safeAccessibilityLabel(_:)``
- ``SwiftUICore/View/safeAccessibilityRemoveTraits(_:)``
- ``SwiftUICore/View/safeAccessibilitySortPriority(_:)``
- ``SwiftUICore/View/safeAccessibilityValue(_:)``

### Appearance Modifiers

- ``SwiftUICore/View/safeBackground(alignment:content:)``
- ``SwiftUICore/View/safeForegroundColor(_:)``
- ``SwiftUICore/View/safeOverlay(alignment:content:)``
- ``SwiftUICore/View/safeTintColor(_:)``

### Auxiliary View Modifiers

- ``SwiftUICore/View/safeNavBarHidden(_:)``
- ``SwiftUICore/View/safeNavBarTitle(_:displayMode:)``

### Drawing & Graphics Modifiers

- ``SwiftUICore/View/safeMask(alignment:_:)``

### Input & Event Modifiers

- ``SwiftUICore/View/safeOnChange(of:initial:_:)-35ola``
- ``SwiftUICore/View/safeOnChange(of:initial:_:)-67u4j``

### Layout Modifiers

- ``SwiftUICore/View/safeIgnoreSafeArea(_:)``

### Search Modifiers

- ``SwiftUICore/View/safeSearchable(text:placement:prompt:suggestions:)``

### Text & Symbol Modifiers

- ``SwiftUICore/View/safeAutocapitalization(_:)``
- ``SwiftUICore/View/safeLineLimit(_:reservesSpace:)``
