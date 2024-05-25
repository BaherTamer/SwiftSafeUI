//
//  SafeBackground.swift
//
//  GitHub Repo: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    /// 
    /// Layers the views that you specify behind this view, handling deprecation logic for different iOS versions.
    ///
    /// This modifier applies the background views using the appropriate modifier based on the iOS version.
    ///
    /// If the device is running iOS 15.0 or later,
    /// it uses the [``background(alignment:content:)``](https://developer.apple.com/documentation/swiftui/view/background(alignment:content:)) modifier.
    /// For earlier versions, it falls back to the [``background(_:alignment:)``](https://developer.apple.com/documentation/swiftui/view/background(_:alignment:))  modifier.
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the implicit `ZStack` that groups the background views. The default is `Alignment.center`.
    ///   - backgroundContent: A `ViewBuilder` closure that provides the views to draw behind this view, stacked in a cascading order from bottom to top. The last view that you list appears at the front of the stack.
    ///
    /// - Returns: A view that applies the specified background views.
    /// 
    public func safeBackground<BackgroundContent: View>(
        alignment: Alignment = .center,
        @ViewBuilder backgroundContent: () -> BackgroundContent
    ) -> some View {
        modifier(SafeBackground(alignment: alignment, backgroundContent: backgroundContent()))
    }
}

fileprivate struct SafeBackground<BackgroundContent: View>: ViewModifier {
    let alignment: Alignment
    let backgroundContent: BackgroundContent
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.background(alignment: alignment) { backgroundContent }
        } else {
            content.background(backgroundContent, alignment: alignment)
        }
    }
}
