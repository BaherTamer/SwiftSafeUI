//
//  SafeOverlay.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    ///
    /// Adds an overlay view to this view, with support for different alignment options.
    ///
    /// - Parameters:
    ///   - alignment: The alignment for the overlay view. The default value is `.center`.
    ///   - content: A closure that returns the view to be used as the overlay.
    ///
    /// - Returns: A view with the specified overlay applied.
    ///
    /// This method allows you to add an overlay view with a specified alignment. It uses a custom modifier that behaves differently based on the iOS version:
    /// - On iOS 15 and later, it utilizes the new [`overlay(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/overlay(alignment:content:)) method.
    /// - On earlier versions, it falls back to the [`overlay(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/overlay(_:alignment:)) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             // Component code...
    ///         }
    ///         .safeOverlay(alignment: .bottomTrailing) {
    ///             BadgeView()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public func safeOverlay<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) -> some View {
        modifier(
            SafeOverlay(
                alignment: alignment,
                overlayContent: content()
            )
        )
    }
}

private struct SafeOverlay<OverlayContent: View>: ViewModifier {
    // MARK: - Inputs
    let alignment: Alignment
    let overlayContent: OverlayContent

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            applyOverlay(content)
        } else {
            applyDeprecatedOverlay(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeOverlay {
    @available(iOS 15.0, *)
    private func applyOverlay(_ content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                overlayContent
            }
    }

    @available(iOS, introduced: 13.0, deprecated: 15.0)
    private func applyDeprecatedOverlay(_ content: Content) -> some View {
        content
            .overlay(
                overlayContent,
                alignment: alignment
            )
    }
}
