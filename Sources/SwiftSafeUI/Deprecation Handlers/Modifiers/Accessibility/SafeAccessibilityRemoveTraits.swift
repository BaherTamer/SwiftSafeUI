//
//  SafeAccessibilityRemoveTraits.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Removes the given traits from this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14, iPadOS 14, macOS 11**, and later, it uses the new [`accessibilityRemoveTraits(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityremovetraits(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(removeTraits:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(removeTraits:)) method.
    nonisolated public func safeAccessibilityRemoveTraits(
        _ traits: AccessibilityTraits
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, macOS 11.0, *) {
            accessibilityRemoveTraits(traits)
        } else {
            accessibility(removeTraits: traits)
        }
    }

}
