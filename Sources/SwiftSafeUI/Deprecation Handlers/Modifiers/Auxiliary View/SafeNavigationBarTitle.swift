//
//  SafeNavigationBarTitle.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

#if os(iOS)

import SwiftUI

@available(iOS 13.0, *)
@available(macOS, unavailable)
extension View {

    /// Sets the title and display mode in the navigation bar for this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14** and later, it utilizes the new [`navigationTitle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)-5di1u ) method along with [`navigationBarTitleDisplayMode(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitledisplaymode(_:) ).
    /// - On earlier versions, it falls back to the [`navigationBarTitle(_:displayMode:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitle(_:displaymode:)-8buvp ) method.
    ///
    /// ## Apple Discussion
    /// Use `safeNavigationBarTitle(_:displayMode:)` to set the title of the navigation bar for this view and specify a display mode for the title from one of the [`NavigationBarItem.TitleDisplayMode`](https://developer.apple.com/documentation/swiftui/navigationbaritem/titledisplaymode) styles. This modifier only takes effect when this view is inside of and visible within a [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview).
    ///
    /// ## Example
    /// In the example below, text for the navigation bar title is provided using a [`Text`](https://developer.apple.com/documentation/swiftui/text) view. The navigation bar title’s [`NavigationBarItem.TitleDisplayMode`](https://developer.apple.com/documentation/swiftui/navigationbaritem/titledisplaymode) is set to `.inline` which places the navigation bar title in the bounds of the navigation bar.
    ///
    /// ```swift
    /// struct FlavorView: View {
    ///    let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///    var body: some View {
    ///         SafeNavigationView {
    ///             List(items, id: \.self) {
    ///                 Text($0)
    ///             }
    ///             .safeNavigationBarTitle(
    ///                 Text("Today's Flavors"),
    ///                 displayMode: .inline
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - title: A title for this view to display in the navigation bar.
    ///   - displayMode: The style to use for displaying the navigation bar title.
    @ViewBuilder
    nonisolated public func safeNavigationBarTitle(
        _ title: Text,
        displayMode: NavigationBarItem.TitleDisplayMode
    ) -> some View {
        if #available(iOS 14.0, *) {
            self
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(displayMode)
        } else {
            navigationBarTitle(
                title,
                displayMode: displayMode
            )
        }
    }


    /// Sets the title and display mode in the navigation bar for this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14** and later, it utilizes the new [`navigationTitle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)-43srq ) method along with [`navigationBarTitleDisplayMode(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitledisplaymode(_:) ).
    /// - On earlier versions, it falls back to the [`navigationBarTitle(_:displayMode:)`](https://developer.apple.com/documentation/swiftui/view/navigationbartitle(_:displaymode:)-gi7a ) method.
    ///
    /// ## Apple Discussion
    /// Use `safeNavigationBarTitle(_:displayMode:)` to set the title of the navigation bar for this view and specify a display mode for the title from one of the [`NavigationBarItem.TitleDisplayMode`](https://developer.apple.com/documentation/swiftui/navigationbaritem/titledisplaymode) styles. This modifier only takes effect when this view is inside of and visible within a [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview).
    ///
    /// If the `titleKey` can't be found, the title uses the text of the key name instead.
    ///
    /// ## Example
    /// In the example below, text for the navigation bar title is provided using a [`Text`](https://developer.apple.com/documentation/swiftui/text) view. The navigation bar title’s [`NavigationBarItem.TitleDisplayMode`](https://developer.apple.com/documentation/swiftui/navigationbaritem/titledisplaymode) is set to `.inline` which places the navigation bar title in the bounds of the navigation bar.
    ///
    /// ```swift
    /// struct FlavorView: View {
    ///    let items = ["Chocolate", "Vanilla", "Strawberry", "Mint Chip", "Pistachio"]
    ///
    ///    var body: some View {
    ///         SafeNavigationView {
    ///             List(items, id: \.self) {
    ///                 Text($0)
    ///             }
    ///             .safeNavigationBarTitle(
    ///                 "Today's Flavors",
    ///                 displayMode: .inline
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - titleKey: A key to a localized description of this view to display in the navigation bar.
    ///   - displayMode: The style to use for displaying the navigation bar title.
    @ViewBuilder
    nonisolated public func safeNavigationBarTitle(
        _ titleKey: LocalizedStringKey,
        displayMode: NavigationBarItem.TitleDisplayMode
    ) -> some View {
        if #available(iOS 14.0, *) {
            self
                .navigationTitle(titleKey)
                .navigationBarTitleDisplayMode(displayMode)
        } else {
            navigationBarTitle(
                titleKey,
                displayMode: displayMode
            )
        }
    }

}

#endif
