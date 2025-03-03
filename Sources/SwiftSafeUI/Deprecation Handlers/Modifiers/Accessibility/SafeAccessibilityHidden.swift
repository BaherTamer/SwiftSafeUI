//
//  SafeAccessibilityHidden.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Specifies whether to hide this view from system accessibility features.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityHidden(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityhidden(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(hidden:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(hidden:)) method.
    ///
    nonisolated public func safeAccessibilityHidden(
        _ hidden: Bool
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityHidden(hidden)
        } else {
            accessibility(hidden: hidden)
        }
    }
}
