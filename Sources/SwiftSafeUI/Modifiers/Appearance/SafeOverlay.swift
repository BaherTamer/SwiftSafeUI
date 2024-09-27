//
//  SafeOverlay.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Adds an overlay view to this view, with support for different alignment options.
    ///
    /// - Parameters:
    ///   - alignment: The alignment for the overlay view. The default value is `.center`.
    ///   - overlayContent: A closure that returns the view to be used as the overlay.
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
    public func safeOverlay<OverlayContent: View>(
        alignment: Alignment = .center,
        @ViewBuilder overlayContent: () -> OverlayContent
    ) -> some View {
        modifier(
            SafeOverlay(
                alignment: alignment,
                overlayContent: overlayContent()
            )
        )
    }
}

fileprivate struct SafeOverlay<OverlayContent: View>: ViewModifier {
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
    @ViewBuilder
    @available(iOS 15.0, *)
    private func applyOverlay(_ content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                overlayContent
            }
    }
    
    @ViewBuilder
    @available(iOS, introduced: 13.0, obsoleted: 15.0)
    private func applyDeprecatedOverlay(_ content: Content) -> some View {
        content
            .overlay(
                overlayContent,
                alignment: alignment
            )
    }
}
