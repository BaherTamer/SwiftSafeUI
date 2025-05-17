//
//  SafeNavigationBarItems.swift
//  SwiftSafeUI
//
//  Created by Baher Tamer on 17/05/2025.
//

#if os(iOS)

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the navigation bar items for this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14, iPadOS 14, macOS 11** and later, it utilizes the new [`toolbar`](https://developer.apple.com/documentation/swiftui/view/toolbar(content:)) modifier with `.topBarLeading` and `.topBarTrailing` placements.
    /// - On earlier versions, it falls back to the [`navigationBarItems(leading:trailing:)`](https://developer.apple.com/documentation/swiftui/view/navigationbaritems(leading:trailing:) ) method.
    ///
    /// ## Apple Discussion
    /// Use `safeNavigationBarItems(leading:trailing:)` to add navigation bar items to the leading and trailing edges of the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible within a ``SafeNavigationView``.
    ///
    /// On iOS 14 and later, the leading item supplements a visible back button, instead of replacing it, by default. To hide the back button, use [`navigationBarBackButtonHidden(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationbarbackbuttonhidden(_:)).
    ///
    /// ## Example
    /// The example below adds buttons to the leading and trailing edges of the button area of the navigation view:
    ///
    /// ```swift
    /// struct FlavorView: View {
    ///     var body: some View {
    ///         SafeNavigationView {
    ///             List {
    ///                 Text("Chocolate")
    ///                 Text("Vanilla")
    ///                 Text("Strawberry")
    ///             }
    ///             .safeNavigationBarTitle("Today‘s Flavors")
    ///             .safeNavigationBarItems(
    ///                 leading: {
    ///                     HStack {
    ///                         Button("Hours") {
    ///                             print("Hours tapped!")
    ///                         }
    ///                     }
    ///                 },
    ///                 trailing: {
    ///                     HStack {
    ///                         Button("Favorites") {
    ///                             print("Favorites tapped!")
    ///                         }
    ///
    ///                         Button("Specials") {
    ///                             print("Specials tapped!")
    ///                         }
    ///                     }
    ///                 }
    ///             )
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - leading: A view that appears on the leading edge of the title.
    ///   - trailing: A view that appears on the trailing edge of the title.
    @ViewBuilder
    nonisolated public func safeNavigationBarItems<Leading: View, Trailing: View>(
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder trailing: () -> Trailing
    ) -> some View {
        if #available(iOS 14.0, macOS 11.0, *) {
            toolbar(content: {
                ToolbarItem(
                    placement: .topBarLeading,
                    content: leading
                )
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: trailing
                )
            })
        } else {
            navigationBarItems(
                leading: leading(),
                trailing: trailing()
            )
        }
    }

}

#endif
