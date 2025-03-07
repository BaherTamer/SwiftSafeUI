//
//  SafeNavigationBarHidden.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(iOS 13.0, *)
extension View {

    /// Hides the navigation bar for this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 18 and later, it utilizes the new [`toolbarVisibility(_:for:)`](https://developer.apple.com/documentation/swiftui/view/toolbarvisibility(_:for:)) method.
    /// - On iOS 16 and later, it uses the deprecated [`toolbar(_:for:)`](https://developer.apple.com/documentation/swiftui/view/toolbar(_:for:)) method.
    /// - On earlier versions, it falls back to the [`navigationBarHidden(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbarhidden(_:)) method.
    ///
    /// ## Apple Discussion
    /// Use this method to hide the navigation bar. This modifier only takes effect when the modified view is inside of and visible within a [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview).
    ///
    /// ## Example
    /// ```swift
    /// SafeNavigationView {
    ///     ContentView()
    ///         .safeNavigationBarHidden(true)
    /// }
    /// ```
    ///
    /// - Parameter hidden: A Boolean value that indicates whether to hide the navigation bar.
    @ViewBuilder
    nonisolated public func safeNavigationBarHidden(_ hidden: Bool) -> some View {
        if #available(iOS 18.0, *) {
            toolbarVisibility(
                getVisibility(for: hidden),
                for: .navigationBar
            )
        } else if #available(iOS 16.0, *) {
            toolbar(
                getVisibility(for: hidden),
                for: .navigationBar
            )
        } else {
            navigationBarHidden(hidden)
        }
    }

}

// MARK: - Private Helpers
extension View {

    /// Determines the visibility state of a view based on the `isHidden` parameter.
    /// - Parameter isHidden: A Boolean value indicating whether the view should be hidden.
    /// - Returns: A `Visibility` value (`.hidden` if `isHidden` is `true`, `.automatic` otherwise).
    @available(iOS 15.0, *)
    nonisolated private func getVisibility(for isHidden: Bool) -> Visibility {
        isHidden ? .hidden : .automatic
    }

}
