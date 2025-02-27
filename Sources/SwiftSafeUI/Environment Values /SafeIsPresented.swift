//
//  SafeIsPresented.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    ///
    /// Provides a Boolean value indicating whether the current view is presented, with support for different iOS versions.
    ///
    /// This environment value determines the presentation state of the current view while ensuring compatibility across iOS versions:
    /// - On iOS 15 and later, it uses the new [`isPresented`](https://developer.apple.com/documentation/swiftui/environmentvalues/ispresented) property.
    /// - On earlier versions, it falls back to the [`presentationMode`](https://developer.apple.com/documentation/swiftui/environmentvalues/presentationmode) environment value isPresented variable.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @Environment(\.safeIsPresented) private var safeIsPresented
    ///
    ///     var body: some View {
    ///         VStack {
    ///             ...
    ///         }
    ///         .safeOnChange(safeIsPresented) { _, isPresented in
    ///             // Do something when first presented.
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public var safeIsPresented: Bool {
        if #available(iOS 15, *) {
            isPresented
        } else {
            presentationMode.wrappedValue.isPresented
        }
    }
}
