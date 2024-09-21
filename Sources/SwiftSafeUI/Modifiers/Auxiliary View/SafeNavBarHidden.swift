//
//  SafeNavBarHidden.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Config navigation bar visibility based on the provided `Bool` value. Handles deprecation logic for different iOS versions.
    ///
    /// If the device is running iOS 18.0 or later,
    /// it uses the new [``toolbarVisibility(_:for:)``](https://developer.apple.com/documentation/swiftui/view/toolbarvisibility(_:for:)) modifier.
    /// If the device is running iOS 16.0 or later,
    /// it uses the new [``toolbar(_:for:)``](https://developer.apple.com/documentation/swiftui/view/toolbar(_:for:)) modifier.
    /// For earlier versions, it falls back to the old [``navigationBarHidden(_:)``](https://developer.apple.com/documentation/swiftui/view/navigationbarhidden(_:)) modifier.
    ///
    /// - Parameters:
    ///   - isHidden: A `Bool` value that determines whether the navigation bar should be hidden or not.
    ///
    /// - Returns: A `View` that reflects the visibility state of the navigation bar.
    ///
    public func safeNavBarHidden(_ isHidden: Bool) -> some View {
        modifier(
            SafeNavBarHidden(isHidden: isHidden)
        )
    }
}

fileprivate struct SafeNavBarHidden: ViewModifier {
    // MARK: - Inputs
    let isHidden: Bool
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 18.0, *) {
            content
                .toolbarVisibility(
                    isHidden ? .hidden : .automatic,
                    for: .navigationBar
                )
        } else if #available(iOS 16.0, *) {
            content
                .toolbar(
                    isHidden ? .hidden : .automatic,
                    for: .navigationBar
                )
        } else {
            content
                .navigationBarHidden(isHidden)
        }
    }
}
