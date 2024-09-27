//
//  SafeBackground.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Adds a background view to this view, with support for different alignment options.
    ///
    /// - Parameters:
    ///   - alignment: The alignment for the background view. The default value is `.center`.
    ///   - backgroundContent: A closure that returns the view to be used as the background.
    ///
    /// - Returns: A view with the specified background applied.
    ///
    /// This method allows you to add a background view with a specified alignment. It uses a custom modifier that behaves differently based on the iOS version:
    /// - On iOS 15 and later, it utilizes the new [`background(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/background(alignment:content:)) method.
    /// - On earlier versions, it falls back to the [`background(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/background(_:alignment:)) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             // Component code...
    ///         }
    ///         .safeBackground(alignment: .topTrailing) {
    ///             StridePattern()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public func safeBackground<BackgroundContent: View>(
        alignment: Alignment = .center,
        @ViewBuilder backgroundContent: () -> BackgroundContent
    ) -> some View {
        modifier(
            SafeBackground(
                alignment: alignment,
                backgroundContent: backgroundContent()
            )
        )
    }
}

fileprivate struct SafeBackground<BackgroundContent: View>: ViewModifier {
    // MARK: - Inputs
    let alignment: Alignment
    let backgroundContent: BackgroundContent
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            applyBackground(content)
        } else {
            applyDeprecatedBackground(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeBackground {
    @ViewBuilder
    @available(iOS 15.0, *)
    private func applyBackground(_ content: Content) -> some View {
        content
            .background(alignment: alignment) {
                backgroundContent
            }
    }
    
    @ViewBuilder
    @available(iOS, introduced: 13.0, obsoleted: 15.0)
    private func applyDeprecatedBackground(_ content: Content) -> some View {
        content
            .background(
                backgroundContent,
                alignment: alignment
            )
    }
}
