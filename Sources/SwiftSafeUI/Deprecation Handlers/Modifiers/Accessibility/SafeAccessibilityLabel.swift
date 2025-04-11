//
//  SafeAccessibilityLabel.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Adds a label to the view that describes its contents.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityLabel(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilitylabel(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(label:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(label:)) method.
    ///
    /// ## Apple Discussion
    /// Use this method to provide an accessibility label for a view that doesn’t display text, like an icon. For example, you could use this method to label a button that plays music with the text “Play”. Don’t include text in the label that repeats information that users already have. For example, don’t use the label “Play button” because a button already has a trait that identifies it as a button.
    nonisolated public func safeAccessibilityLabel(
        _ label: Text
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, macOS 11.0, *) {
            accessibilityLabel(label)
        } else {
            accessibility(label: label)
        }
    }

}
