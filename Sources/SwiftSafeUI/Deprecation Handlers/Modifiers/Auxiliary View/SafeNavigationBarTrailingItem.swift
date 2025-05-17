//
//  SafeNavigationBarTrailingItem.swift
//  SwiftSafeUI
//
//  Created by Baher Tamer on 17/05/2025.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the navigation bar trailing item for this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 14, iPadOS 14, macOS 11** and later, it utilizes the new [`toolbar`](https://developer.apple.com/documentation/swiftui/view/toolbar(content:)) modifier with `.topBarTrailing` placement.
    /// - On earlier versions, it falls back to the [`navigationBarItems(trailing:)`](https://developer.apple.com/documentation/swiftui/view/navigationbaritems(trailing:)) method.
    ///
    /// ## Apple Discussion
    /// Use `safeNavigationBarTrailingItem(content:)` to add navigation bar item to the trailing edge of the navigation bar for this view.
    ///
    /// This modifier only takes effect when this view is inside of and visible within a ``SafeNavigationView``.
    ///
    /// ## Example
    /// The example below adds buttons to the trailing edge of the button area of the navigation view:
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
    ///             .safeNavigationBarTrailingItem(
    ///                 content: {
    ///                     HStack {
    ///                         Button("Hours") {
    ///                             print("Hours tapped!")
    ///                         }
    ///
    ///                         Button("Help") {
    ///                             print("Help tapped!")
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
    ///   - content: A view that appears on the trailing edge of the title.
    @ViewBuilder
    nonisolated public func safeNavigationBarTrailingItem<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        if #available(iOS 14.0, macOS 11.0, *) {
            toolbar(content: {
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: content
                )
            })
        } else {
            navigationBarItems(
                trailing: content()
            )
        }
    }

}
