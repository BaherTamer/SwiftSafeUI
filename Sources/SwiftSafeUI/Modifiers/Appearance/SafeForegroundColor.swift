//
//  SafeForegroundColor.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    /// 
    /// Applies a foreground color to the current view, handling deprecation logic for different iOS versions.
    ///
    /// This modifier applies the foreground color using the appropriate modifier based on the iOS version.
    ///
    /// If the device is running iOS 15.0 or later,
    /// it uses the [``foregroundstyle(_:) ``](https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:)) modifier.
    /// For earlier versions, it falls back to the [``foregroundcolor(_:) ``](https://developer.apple.com/documentation/swiftui/view/foregroundcolor(_:)) modifier.
    ///
    /// - Parameter color: The `Color` to apply as the foreground color.
    /// 
    /// - Returns: A view that applies the specified foreground color.
    /// 
    public func safeForegroundColor(_ color: Color) -> some View {
        modifier(SafeForegroundColor(color: color))
    }
}

fileprivate struct SafeForegroundColor: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.foregroundStyle(color)
        } else {
            content.foregroundColor(color)
        }
    }
}
