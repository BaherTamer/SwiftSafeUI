//
//  SafeDismiss.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

@MainActor
extension EnvironmentValues {
    ///
    /// Provides a dismiss action for dismissing the current view, with support for different iOS versions.
    ///
    /// This environment value exposes a dismiss action that ensures compatibility with different iOS versions:
    /// - On iOS 15 and later, it uses the new [`dismiss()`](https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss) method.
    /// - On earlier versions, it falls back to the [`presentationMode`](https://developer.apple.com/documentation/swiftui/environmentvalues/presentationmode) environment value dismiss method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @Environment(\.safeDismiss) private var safeDismiss
    ///
    ///     var body: some View {
    ///         Button("Dismiss") {
    ///             safeDismiss()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public var safeDismiss: () -> Void {
        dismissAction
    }
    
    private func dismissAction() {
        if #available(iOS 15, *) {
            dismiss()
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
