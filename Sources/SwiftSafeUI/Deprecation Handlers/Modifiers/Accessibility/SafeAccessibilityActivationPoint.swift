//
//  SafeAccessibilityActivationPoint.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {

    /// The activation point for an element is the location assistive technologies use to initiate gestures.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 14 and later, it uses the new [`accessibilityActivationPoint(_:)`](https://developer.apple.com/documentation/swiftui/view/accessibilityactivationpoint(_:)) method.
    /// - On earlier versions, it falls back to the [`accessibility(activationPoint:)`](https://developer.apple.com/documentation/swiftui/view/accessibility(activationPoint:)) method.
    ///
    /// ## Apple Discussion
    /// Use this modifier to ensure that the activation point for a small element remains accurate even if you present a larger version of the element to `VoiceOver`.
    ///
    /// If an activation point is not provided, an activation point will be derrived from one of the accessibility elements decendents or from the center of the accessibility frame.
    nonisolated public func safeAccessibilityActivationPoint(
        _ activationPoint: CGPoint
    ) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        if #available(iOS 14.0, *) {
            accessibilityActivationPoint(activationPoint)
        } else {
            accessibility(activationPoint: activationPoint)
        }
    }

}
