//
//  SafeOverlay.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(iOS 13.0, *)
extension View {

    /// Layers the views that you specify in front of this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 15 and later, it utilizes the new [`overlay(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/overlay(alignment:content:)) method.
    /// - On earlier versions, it falls back to the [`overlay(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/overlay(_:alignment:)) method.
    ///
    /// ## Apple Discussion
    /// Use this modifier to place one or more views in front of another view.
    ///
    /// You can achieve layering without an overlay modifier by putting both the modified view and the overlay content into a [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack). This can produce a simpler view hierarchy, but changes the layout priority that SwiftUI applies to the views. Use the overlay modifier when you want the modified view to dominate the layout.
    ///
    /// ## Example
    /// ```swift
    /// Color.blue
    ///     .frame(width: 200, height: 200)
    ///     .safeOverlay(alignment: .bottom) {
    ///         Circle()
    ///             .frame(width: 100, height: 100)
    ///
    ///         Star()
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the
    ///     implicit [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack) that groups the foreground views. The default
    ///     is [`center`](https://developer.apple.com/documentation/swiftui/alignment/center).
    ///   - content: A [`ViewBuilder`](https://developer.apple.com/documentation/swiftui/viewbuilder) that you use to declare the views to
    ///     draw in front of this view, stacked in the order that you list them.
    ///     The last view that you list appears at the front of the stack.
    ///
    /// - Returns: A view that uses the specified content as a foreground.
    @ViewBuilder
    nonisolated public func safeOverlay<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if #available(iOS 15.0, *) {
            overlay(
                alignment: alignment,
                content: content
            )
        } else {
            overlay(
                content(),
                alignment: alignment
            )
        }
    }

}
