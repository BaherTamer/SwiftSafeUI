//
//  SafeAccessibilityInputLabels.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets alternate input labels with which users identify a view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14, iPadOS 14, macOS 11**, and later, it uses the new [`accessibilityInputLabels(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityinputlabels(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(inputLabels:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(inputLabels:)) method.
    ///
    /// ## Apple Discussion
    /// Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.
    ///
    /// > Note: If you don’t specify any input labels, the user can still refer to the view using the accessibility label that you add with the `safeAccessibilityLabel()` modifier.
    nonisolated public func safeAccessibilityInputLabels(
        _ inputLabels: [Text]
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, macOS 11.0, *) {
            accessibilityInputLabels(inputLabels)
        } else {
            accessibility(inputLabels: inputLabels)
        }
    }

}
