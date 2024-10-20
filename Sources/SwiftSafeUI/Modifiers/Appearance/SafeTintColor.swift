//
//  SafeTintColor.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    ///
    /// Applies a tint color to this view, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - color: The color to be applied as the tint.
    ///
    /// - Returns: A view with the specified tint color applied.
    ///
    /// This method allows you to apply a tint color to a view, adapting to the iOS version:
    /// - On iOS 16 and later, it utilizes the new [`tint(_:)`](https://developer.apple.com/documentation/swiftui/view/tint(_:)-23xyq) method.
    /// - On earlier versions, it falls back to the [`accentColor(_:)`](https://developer.apple.com/documentation/swiftui/view/accentcolor(_:) ) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Image(systemName: "star")
    ///             .renderingMode(.template)
    ///             .safeTintColor(.yellow)
    ///     }
    /// }
    /// ```
    ///
    nonisolated public func safeTintColor(_ color: Color) -> some View {
        modifier(
            SafeTintColor(color: color)
        )
    }
}

private struct SafeTintColor: ViewModifier {
    // MARK: - Inputs
    let color: Color

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            applyTint(content)
        } else {
            applyAccentColor(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeTintColor {
    @available(iOS 16.0, *)
    private func applyTint(_ content: Content) -> some View {
        content
            .tint(color)
    }

    @available(iOS, introduced: 13.0, deprecated: 16.0)
    private func applyAccentColor(_ content: Content) -> some View {
        content
            .accentColor(color)
    }
}
