//
//  SafeNavBarHidden.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Controls the visibility of the navigation bar for this view, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - isHidden: A `Bool` value that indicates whether the navigation bar should be hidden.
    ///
    /// - Returns: A view with the specified navigation bar visibility applied.
    ///
    /// This method allows you to control the visibility of the navigation bar, adapting to the iOS version:
    /// - On iOS 18 and later, it utilizes the new [`toolbarVisibility(_:for:)`](https://developer.apple.com/documentation/swiftui/view/toolbarvisibility(_:for:)) method.
    /// - On iOS 16 and later, it uses the deprecated [`toolbar(_:for:)`](https://developer.apple.com/documentation/swiftui/view/toolbar(_:for:)) method.
    /// - On earlier versions, it falls back to the [`navigationBarHidden(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbarhidden(_:)) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             VStack {
    ///                 Text("SwiftSafeUI")
    ///             }
    ///             .safeNavBarHidden(true)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public func safeNavBarHidden(_ isHidden: Bool) -> some View {
        modifier(
            SafeNavBarHidden(isHidden: isHidden)
        )
    }
}

fileprivate struct SafeNavBarHidden: ViewModifier {
    // MARK: - Inputs
    let isHidden: Bool
    
    // MARK: - Variables
    @available(iOS 15.0, *)
    private var visibility: Visibility {
        isHidden ? .hidden : .automatic
    }
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 18.0, *) {
            applyToolbarVisibility(content)
        } else if #available(iOS 16.0, *) {
            applyToolbar(content)
        } else {
            applyNavigationBarHidden(content)
        }
    }
}

// MARK: - Private Helpers
fileprivate extension SafeNavBarHidden {
    @available(iOS 18.0, *)
    private func applyToolbarVisibility(_ content: Content) -> some View {
        content
            .toolbarVisibility(
                visibility,
                for: .navigationBar
            )
    }
    
    @available(iOS, introduced: 16.0, deprecated: 18.0)
    private func applyToolbar(_ content: Content) -> some View {
        content
            .toolbar(
                visibility,
                for: .navigationBar
            )
    }
    
    @available(iOS, introduced: 13.0, deprecated: 16.0)
    private func applyNavigationBarHidden(_ content: Content) -> some View {
        content
            .navigationBarHidden(isHidden)
    }
}
