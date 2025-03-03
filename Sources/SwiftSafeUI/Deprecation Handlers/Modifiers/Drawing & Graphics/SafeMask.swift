//
//  SafeMask.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    /// Masks this view using the alpha channel of the given view.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 15 and later, it uses the new [`mask(alignment:_:)`](https://developer.apple.com/documentation/swiftui/view/mask(alignment:_:)) method.
    /// - On earlier versions, it falls back to the deprecated [`mask(_:)`](https://developer.apple.com/documentation/swiftui/view/mask(_:)) method.
    ///
    /// ## Apple's Discussion
    /// Use ``safeMask(alignment:_:)`` when you want to apply the alpha (opacity) value of another view to the current view.
    ///
    /// ## Example
    /// This example shows an image masked by rectangle with a 10% opacity:
    ///
    /// ```swift
    /// Image(systemName: "envelope.badge.fill")
    ///     .safeForegroundColor(Color.blue)
    ///     .font(.system(size: 128, weight: .regular))
    ///     .safeMask {
    ///         Rectangle().opacity(0.1)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///     - alignment: The alignment for `mask` in relation to this view.
    ///     - content: The view whose alpha the rendering system applies to the specified view.
    ///
    @ViewBuilder
    nonisolated public func safeMask<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ content: () -> Content
    ) -> some View {
        if #available(iOS 15.0, *) {
            mask(
                alignment: alignment,
                content
            )
        } else {
            let framedContent = content().frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: alignment
            )
            mask(framedContent)
        }
    }
}
