//
//  SafeIgnoreSafeArea.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    ///
    /// Expands the safe area of a view.
    ///
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it utilizes the new [`ignoresSafeArea(_:edges:))`](https://developer.apple.com/documentation/swiftui/view/ignoressafearea(_:edges:)) method.
    /// - On earlier versions, it falls back to the [`edgesIgnoringSafeArea(_:)`](https://developer.apple.com/documentation/swiftui/view/edgesIgnoringSafeArea(_:) ) method.
    ///
    /// ## Apple Discussion
    /// By default, the SwiftUI layout system sizes and positions views to avoid certain safe areas. This ensures that system content like the software keyboard or edges of the device don’t obstruct your views. To extend your content into these regions, you can ignore safe areas on specific edges by applying this modifier.
    ///
    /// For examples of how to use this modifier, see [Adding a background to your view](https://developer.apple.com/documentation/swiftui/adding-a-background-to-your-view).
    ///
    /// ## Example
    /// ```swift
    /// VStack {
    ///     Text("This text is outside of the top safe area.")
    ///         .safeIgnoreSafeArea([.top])
    ///         .border(Color.purple)
    ///     Text("This text is inside VStack.")
    ///         .border(Color.yellow)
    /// }
    /// .border(Color.gray)
    /// ```
    ///
    /// - Parameter edges: The set of edges to expand. Any edges that you
    ///     don't include in this set remain unchanged. The set includes all
    ///     edges by default.
    ///
    /// - Returns: A view with an expanded safe area.
    ///
    @ViewBuilder
    nonisolated public func safeIgnoreSafeArea(
        _ edges: Edge.Set = .all
    ) -> some View {
        if #available(iOS 14.0, *) {
            ignoresSafeArea(edges: edges)
        } else {
            edgesIgnoringSafeArea(edges)
        }
    }
}
