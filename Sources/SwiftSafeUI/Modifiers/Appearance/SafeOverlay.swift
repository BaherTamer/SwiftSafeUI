//
//  SafeOverlay.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    /// 
    /// Layers the views that you specify in front of this view, handling deprecation logic for different iOS versions.
    ///
    /// This modifier applies the overlay views using the appropriate modifier based on the iOS version. 
    ///
    /// If the device is running iOS 15.0 or later,
    /// it uses the [``overlay(alignment:content:)``](https://developer.apple.com/documentation/swiftui/view/overlay(alignment:content:)) modifier.
    /// For earlier versions, it falls back to the [``overlay(_:alignment:)``](https://developer.apple.com/documentation/swiftui/view/overlay(_:alignment:)) modifier.
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the implicit `ZStack` that groups the overlay views. The default is `Alignment.center`.
    ///   - overlayContent: A `ViewBuilder` closure that provides the views to draw in front of this view, stacked in the order that you list them. The last view that you list appears at the front of the stack.
    ///   
    /// - Returns: A view that applies the specified overlay views.
    ///
    public func safeOverlay<OverlayContent: View>(
        alignment: Alignment = .center,
        @ViewBuilder overlayContent: () -> OverlayContent
    ) -> some View {
        modifier(SafeOverlay(alignment: alignment, overlayContent: overlayContent()))
    }
}

fileprivate struct SafeOverlay<OverlayContent: View>: ViewModifier {
    let alignment: Alignment
    let overlayContent: OverlayContent
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.overlay(alignment: alignment) { overlayContent }
        } else {
            content.overlay(overlayContent, alignment: alignment)
        }
    }
}
