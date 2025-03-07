//
//  SafeAccessibilityAddTraits.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {

    /// Adds the given traits to the view.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityAddTraits(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityaddtraits(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(addTraits:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(addTraits:)) method.
    nonisolated public func safeAccessibilityAddTraits(
        _ traits: AccessibilityTraits
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityAddTraits(traits)
        } else {
            accessibility(addTraits: traits)
        }
    }

}
