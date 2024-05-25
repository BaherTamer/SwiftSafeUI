//
//  SafeTintColor.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    /// 
    /// Applies a tint color to the current view, handling deprecation logic for different iOS versions.
    ///
    /// This modifier applies the tint color using the appropriate modifier based on the iOS version.
    ///
    /// If the device is running iOS 16.0 or later,
    /// it uses the [``tint(_:)``](https://developer.apple.com/documentation/swiftui/view/tint(_:)-23xyq) modifier.
    /// For earlier versions, it falls back to the [``accentcolor(_:)``](https://developer.apple.com/documentation/swiftui/view/accentcolor(_:)) modifier.
    ///
    /// - Parameter color: The `Color` to apply as the tint color.
    /// 
    /// - Returns: A view that applies the specified tint color.
    /// 
    public func safeTintColor(_ color: Color) -> some View {
        modifier(SafeTintColor(color: color))
    }
}

fileprivate struct SafeTintColor: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.tint(color)
        } else {
            content.accentColor(color)
        }
    }
}
