//
//  SafeOnChange.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
extension View {
    ///
    /// Adds an action to perform when the given value changes. Handles deprecation logic for different iOS versions.
    ///
    /// This modifier triggers an action when the specified value changes.
    /// It ensures compatibility with different iOS versions by using the appropriate `onChange` modifier based on the iOS version.
    ///
    /// If the device is running iOS 17.0 or later,
    /// it uses the new [``onChange(of:initial:_:)``](https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-4psgg) modifier.
    /// For earlier versions, it falls back to the old [``onChange(of:perform:)``](https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)) modifier.
    ///
    /// > Note: This modifier is available from iOS 14.0 or later.
    ///
    /// - Parameters:
    ///   - value: The value to monitor for changes.
    ///   - action: A closure that is called with the old and new values when a change is detected.
    ///
    /// - Returns: A view that applies the specified action when the value changes.
    ///
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
    let value: Value
    var action: (Value, Value) -> Void
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .onChange(of: value, action)
        } else {
            content
                .onChange(of: value) { [value] newValue in
                    action(value, newValue)
                }
        }
    }
}
