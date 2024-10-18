//
//  SafeOnChange.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
extension View {
    ///
    /// Executes an action when the specified value changes, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes. This value must conform to the `Equatable` protocol.
    ///   - action: A closure that is executed when the observed value changes. It receives the old and new values as parameters.
    ///
    /// - Returns: A view that responds to changes in the specified value.
    ///
    /// This method allows you to observe changes to a value and execute a specified action. It behaves differently based on the iOS version:
    /// - On iOS 17 and later, it utilizes the new [`onChange(of:initial:_:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-4psgg) method.
    /// - On earlier versions, it falls back to the [`onChange(of:perform:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)) method.
    ///
    /// > Important: This modifier requires iOS 14 or later.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var count = 0
    ///
    ///     var body: some View {
    ///         Text("Count: \(count)")
    ///             .safeOnChange(count) { oldValue, newValue in
    ///                 print("Count changed from \(oldValue) to \(newValue)")
    ///             }
    ///     }
    /// }
    /// ```
    ///
    nonisolated
    public func safeOnChange<Value: Equatable>(
        _ value: Value,
        perform action: @escaping (Value, Value) -> Void
    ) -> some View {
        modifier(
            SafeOnChange(
                value: value,
                action: action
            )
        )
    }
}

@available(iOS 14.0, *)
fileprivate struct SafeOnChange<Value: Equatable>: ViewModifier {
    // MARK: - Inputs
    let value: Value
    var action: (Value, Value) -> Void
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            applyOnChange(content)
        } else {
            applyDeprecatedOnChange(content)
        }
    }
}

// MARK: - Private Helpers
@available(iOS 14.0, *)
fileprivate extension SafeOnChange {
    @available(iOS 17.0, *)
    private func applyOnChange(_ content: Content) -> some View {
        content
            .onChange(of: value, action)
    }
    
    @available(iOS, introduced: 14.0, deprecated: 17.0)
    private func applyDeprecatedOnChange(_ content: Content) -> some View {
        content
            .onChange(of: value) { [value] newValue in
                action(value, newValue)
            }
    }
}
