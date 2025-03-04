//
//  SafeAccessibilityIdentifier.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Uses the string you specify to identify the view.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityIdentifier(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityidentifier(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(identifier:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(identifier:)) method.
    ///
    /// ## Apple Discussion
    /// Use this value for testing. It isn’t visible to the user.
    ///
    nonisolated public func safeAccessibilityIdentifier(
        _ identifier: String
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityIdentifier(identifier)
        } else {
            accessibility(identifier: identifier)
        }
    }
}
