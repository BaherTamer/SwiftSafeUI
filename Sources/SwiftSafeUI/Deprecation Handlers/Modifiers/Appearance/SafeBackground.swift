//
//  SafeBackground.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(iOS 13.0, *)
extension View {

    /// Layers the views that you specify behind this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 15 and later, it utilizes the new [`background(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/background(alignment:content:)) method.
    /// - On earlier versions, it falls back to the [`background(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/background(_:alignment:)) method.
    ///
    /// ## Apple Discussion
    /// Use this modifier to place one or more views behind another view.
    ///
    /// You can achieve layering without a background modifier by putting both the modified view and the background content into a [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack). This produces a simpler view hierarchy, but it changes the layout priority that SwiftUI applies to the views. Use the background modifier when you want the modified view to dominate the layout.
    ///
    /// ## Example
    /// ```swift
    /// Color.blue
    ///     .frame(width: 200, height: 10)
    ///     .safeBackground(alignment: .leading) {
    ///         Color.green
    ///             .frame(width: 10, height: 100)
    ///
    ///         Circle()
    ///             .frame(width: 50, height: 50)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the implicit [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack) that groups the background views. The default is [`center`](https://developer.apple.com/documentation/swiftui/alignment/center).
    ///   - content: A [`ViewBuilder`](https://developer.apple.com/documentation/swiftui/viewbuilder) that you use to declare the views to draw behind this view, stacked in a cascading order from bottom to top. The last view that you list appears at the front of the stack.
    ///
    /// - Returns: A view that uses the specified content as a background.
    @ViewBuilder
    nonisolated public func safeBackground<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if #available(iOS 15.0, *) {
            background(
                alignment: alignment,
                content: content
            )
        } else {
            background(
                content(),
                alignment: alignment
            )
        }
    }

}
