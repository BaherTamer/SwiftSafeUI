//
//  SafeAccessibilitySortPriority.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the sort priority order for this view’s accessibility element, relative to other elements at the same level.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilitySortPriority(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilitysortpriority(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(sortPriority:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(sortPriority:)) method.
    ///
    /// ## Apple Discussion
    /// Higher numbers are sorted first. The default sort priority is zero.
    nonisolated public func safeAccessibilitySortPriority(
        _ sortPriority: Double
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, macOS 11.0, *) {
            accessibilitySortPriority(sortPriority)
        } else {
            accessibility(sortPriority: sortPriority)
        }
    }

}
