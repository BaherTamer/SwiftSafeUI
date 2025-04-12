//
//  SafeFocusable.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

#if os(macOS)

import SwiftUICore

@available(macOS 10.15, *)
extension View {

    /// Specifies if the view is focusable.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **macOS 12** and later, it utilizes the new [`focusable(_:)`](https://developer.apple.com/documentation/swiftui/view/focusable(_:)) method.
    /// - On earlier versions, it falls back to the [`focusable(_:onfocuschange:)`](https://developer.apple.com/documentation/swiftui/view/focusable(_:onfocuschange:)) method.
    ///
    /// - Parameter isFocusable: A Boolean value that indicates whether this view is focusable.
    ///
    /// - Returns: A view that sets whether a view is focusable.
    @ViewBuilder
    nonisolated public func safeFocusable(
        _ isFocusable: Bool = true
    ) -> some View {
        if #available(macOS 12.0, *) {
            focusable(isFocusable)
        } else {
            focusable(
                isFocusable,
                onFocusChange: { _ in }
            )
        }
    }

}

#endif
