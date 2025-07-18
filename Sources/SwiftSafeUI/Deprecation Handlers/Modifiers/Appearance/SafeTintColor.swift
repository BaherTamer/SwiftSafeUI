//
//  SafeTintColor.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the tint color within this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 16, iPadOS 16, macOS 13**, and later, it utilizes the new [`tint(_:)`](https://developer.apple.com/documentation/swiftui/view/tint(_:)-23xyq) method.
    /// - On earlier versions, it falls back to the [`accentColor(_:)`](https://developer.apple.com/documentation/swiftui/view/accentcolor(_:) ) method.
    ///
    /// ## Apple Discussion
    /// Use this method to override the default accent color for this view. Unlike an app’s accent color, which can be overridden by user preference, the tint color is always respected and should be used as a way to provide additional meaning to the control.
    ///
    /// ## Example
    /// This example shows Answer and Decline buttons with green and red tint colors, respectively.
    ///
    /// ```swift
    /// struct ControlTint: View {
    ///     var body: some View {
    ///         HStack {
    ///             Button {
    ///                 // Answer the call
    ///             } label: {
    ///                 Label("Answer", systemImage: "phone")
    ///             }
    ///             .tint(.green)
    ///
    ///             Button {
    ///                 // Decline the call
    ///             } label: {
    ///                 Label("Decline", systemImage: "phone.down")
    ///             }
    ///             .tint(.red)
    ///         }
    ///         .buttonStyle(.borderedProminent)
    ///         .padding()
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter color: The color to use as an accent color.
    @ViewBuilder
    nonisolated public func safeTintColor(_ color: Color?) -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            tint(color)
        } else {
            accentColor(color)
        }
    }

}
