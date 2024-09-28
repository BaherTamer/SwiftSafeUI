//
//  SafeNavBarTitle.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Sets the navigation bar title for this view, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - text: The text to be displayed as the navigation bar title.
    ///   - displayMode: The display mode for the navigation bar title.
    ///
    /// - Returns: A view with the specified navigation bar title applied.
    ///
    /// This method allows you to set the navigation bar title for a view, adapting to the iOS version:
    /// - On iOS 14 and later, it utilizes the new [`navigationTitle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)-5di1u ) method along with [`navigationBarTitleDisplayMode(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitledisplaymode(_:) ).
    /// - On earlier versions, it falls back to the [`navigationBarTitle(_:displayMode:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitle(_:displaymode:)-6vw86 ) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         NavigationView {
    ///             Text("SwiftSafeUI")
    ///                 .safeNavBarTitle(
    ///                     Text("SafeNavBarTitle"),
    ///                     displayMode: .inline
    ///                 )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public func safeNavBarTitle(
        _ text: Text,
        displayMode: NavigationBarItem.TitleDisplayMode
    ) -> some View {
        modifier(
            SafeNavBarTitle(
                text: text,
                displayMode: displayMode
            )
        )
    }
}

fileprivate struct SafeNavBarTitle: ViewModifier {
    // MARK: - Inputs
    let text: Text
    let displayMode: NavigationBarItem.TitleDisplayMode
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            applyNavigationTitle(content)
        } else {
            applyNavigationBarTitle(content)
        }
    }
}

// MARK: - Private Helpers
fileprivate extension SafeNavBarTitle {
    @available(iOS 14.0, *)
    private func applyNavigationTitle(_ content: Content) -> some View {
        content
            .navigationTitle(text)
            .navigationBarTitleDisplayMode(displayMode)
    }
    
    @available(iOS, introduced: 13.0, deprecated: 14.0)
    private func applyNavigationBarTitle(_ content: Content) -> some View {
        content
            .navigationBarTitle(
                text,
                displayMode: displayMode
            )
    }
}
