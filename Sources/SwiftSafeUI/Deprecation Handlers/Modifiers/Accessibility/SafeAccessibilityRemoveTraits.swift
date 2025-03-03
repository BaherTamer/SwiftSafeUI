//
//  SafeAccessibilityRemoveTraits.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Removes the given traits from this view.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityRemoveTraits(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityremovetraits(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(removeTraits:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(removeTraits:)) method.
    ///
    nonisolated public func safeAccessibilityRemoveTraits(
        _ traits: AccessibilityTraits
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityRemoveTraits(traits)
        } else {
            accessibility(removeTraits: traits)
        }
    }
}
