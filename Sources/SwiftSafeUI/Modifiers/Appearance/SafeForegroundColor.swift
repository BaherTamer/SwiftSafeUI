//
//  SafeForegroundColor.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Applies a foreground color to this view, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - color: The color to be applied as the foreground color.
    ///
    /// - Returns: A view with the specified foreground color applied.
    ///
    /// This method allows you to apply a foreground color to a view, adapting to the iOS version:
    /// - On iOS 15 and later, it utilizes the new [`foregroundStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:) ) method.
    /// - On earlier versions, it falls back to the [`foregroundColor(_:)`](https://developer.apple.com/documentation/swiftui/view/foregroundcolor(_:) ) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("SwiftSafeUI")
    ///             .safeForegroundColor(.green)
    ///     }
    /// }
    /// ```
    ///
    public func safeForegroundColor(_ color: Color) -> some View {
        modifier(
            SafeForegroundColor(color: color)
        )
    }
}

fileprivate struct SafeForegroundColor: ViewModifier {
    // MARK: - Inputs
    let color: Color
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            applyForegroundStyle(content)
        } else {
            applyForegroundColor(content)
        }
    }
}

// MARK: - Private Helpers
fileprivate extension SafeForegroundColor {
    @available(iOS 15.0, *)
    private func applyForegroundStyle(_ content: Content) -> some View {
        content
            .foregroundStyle(color)
    }
    
    @available(iOS, introduced: 13.0, deprecated: 15.0)
    private func applyForegroundColor(_ content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}
