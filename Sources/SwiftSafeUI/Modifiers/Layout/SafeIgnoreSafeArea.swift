//
//  SafeIgnoreSafeArea.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Allows this view to ignore safe area insets, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - edges: The edges to ignore safe area insets for. Default value is `.all`.
    ///
    /// - Returns: A view that ignores the specified safe area insets.
    ///
    /// This method enables a view to ignore safe area insets, adapting to the iOS version:
    /// - On iOS 14 and later, it utilizes the new [`ignoresSafeArea(_:edges:))`](https://developer.apple.com/documentation/swiftui/view/ignoressafearea(_:edges:)) method.
    /// - On earlier versions, it falls back to the [`edgesIgnoringSafeArea(_:)`](https://developer.apple.com/documentation/swiftui/view/edgesIgnoringSafeArea(_:) ) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Color.green
    ///             .safeIgnoreSafeArea(.bottom)
    ///     }
    /// }
    /// ```
    ///
    nonisolated public func safeIgnoreSafeArea(
        _ edges: Edge.Set = .all
    ) -> some View {
        modifier(
            SafeIgnoreSafeArea(edges: edges)
        )
    }
}

private struct SafeIgnoreSafeArea: ViewModifier {
    // MARK: - Inputs
    let edges: Edge.Set

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            applyIgnoresSafeArea(content)
        } else {
            applyEdgesIgnoringSafeArea(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeIgnoreSafeArea {
    @available(iOS 14.0, *)
    private func applyIgnoresSafeArea(_ content: Content) -> some View {
        content
            .ignoresSafeArea(edges: edges)
    }

    @available(iOS, introduced: 13.0, deprecated: 14.0)
    private func applyEdgesIgnoringSafeArea(_ content: Content) -> some View {
        content
            .edgesIgnoringSafeArea(edges)
    }
}
