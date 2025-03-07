//
//  SafeAccessibilityHint.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {

    /// Communicates to the user what happens after performing the view’s action.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityHint(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityhint(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(hint:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(hint:)) method.
    ///
    /// ## Apple Discussion
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    nonisolated public func safeAccessibilityHint(
        _ hint: Text
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityHint(hint)
        } else {
            accessibility(hint: hint)
        }
    }

}
