# SafeModifiers

Ensures compatibility for `SwiftUI` modifiers across different OS versions.

@Metadata {
    @PageColor(green)
    @TitleHeading("Catalog")
}


## Overview

**SafeModifiers** includes custom `SwiftUI` modifiers within the **SwiftSafeUI** framework, specifically designed to ensure compatibility across various OS versions while reducing code duplication and minimizing technical debt.

By encapsulating necessary logic, **SafeModifiers** ensures that your app utilizes the latest available modifiers while gracefully falling back to deprecated ones when required. This allows you to focus on building your app without worrying about the hassle of writing version-specific checks.


## Topics

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

- ``SwiftUICore/View/safeNavigationBarHidden(_:)``
- ``SwiftUICore/View/safeNavigationBarTitle(_:displayMode:)-3kpza``
- ``SwiftUICore/View/safeNavigationBarTitle(_:displayMode:)-3cyjb``

### Drawing & Graphics Modifiers

- ``SwiftUICore/View/safeMask(alignment:_:)``

### Input & Event Modifiers

- ``SwiftUICore/View/safeOnChange(of:initial:_:)-35ola``
- ``SwiftUICore/View/safeOnChange(of:initial:_:)-67u4j``

### Layout Modifiers

- ``SwiftUICore/View/safeIgnoreSafeArea(_:)``

### Search Modifiers

- ``SwiftUICore/View/safeSearchable(text:placement:prompt:suggestions:)-9lajn``
- ``SwiftUICore/View/safeSearchable(text:placement:prompt:suggestions:)-186xi``
- ``SwiftUICore/View/safeSearchable(text:placement:prompt:suggestions:)-69o1z``

### Text & Symbol Modifiers

- ``SwiftUICore/View/safeAutocapitalization(_:)``
- ``SwiftUICore/View/safeLineLimit(_:reservesSpace:)``
