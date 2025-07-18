//
//  SafeForegroundColor.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the color of the foreground elements displayed by this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 15, iPadOS 15, macOS 12**, and later, it utilizes the new [`foregroundStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:) ) method.
    /// - On earlier versions, it falls back to the [`foregroundColor(_:)`](https://developer.apple.com/documentation/swiftui/view/foregroundcolor(_:) ) method.
    ///
    /// ## Apple Discussion
    /// Use this method to style foreground content like text, shapes, and template images (including symbols).
    ///
    /// ## Example
    /// ```swift
    /// HStack {
    ///     Image(systemName: "triangle.fill")
    ///     Text("Hello, world!")
    ///     RoundedRectangle(cornerRadius: 5)
    ///         .frame(width: 40, height: 20)
    /// }
    /// .safeForegroundColor(.green)
    /// ```
    ///
    /// - Parameter color: The foreground color to use when displaying this view.
    ///
    /// - Returns: A view that uses the foreground color you supply.
    @ViewBuilder
    nonisolated public func safeForegroundColor(_ color: Color) -> some View {
        if #available(iOS 15.0, macOS 12.0, *) {
            foregroundStyle(color)
        } else {
            foregroundColor(color)
        }
    }

}
