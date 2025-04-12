//
//  SafeAccessibilityValue.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Adds a textual description of the value that the view contains.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14, iPadOS 14, macOS 11**, and later, it uses the new [`accessibilityValue(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityvalue(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(value:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(value:)) method.
    ///
    /// ## Apple Discussion
    /// Use this method to describe the value represented by a view, but only if that’s different than the view’s label. For example, for a slider that you label as “Volume” using `accessibilityLabel()`, you can provide the current volume setting, like “60%”, using `accessibilityValue()`.
    nonisolated public func safeAccessibilityValue(
        _ value: Text
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, macOS 11.0, *) {
            accessibilityValue(value)
        } else {
            accessibility(value: value)
        }
    }

}
