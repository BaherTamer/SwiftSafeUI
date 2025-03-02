//
//  SafeMask.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    /// Applies a mask to this view using the provided content and alignment.
    ///
    /// - Parameters:
    ///   - alignment: The alignment for the mask content. The default value is `.center`.
    ///   - content: A closure that returns the view to be used as the mask.
    ///
    /// - Returns: A view that applies the specified mask.
    ///
    /// This method applies a mask view over the content, with compatibility for different iOS versions:
    /// - On iOS 15 and later, it uses the new [`mask(alignment:_:)`](https://developer.apple.com/documentation/swiftui/view/mask(alignment:_:)) method.
    /// - On earlier versions, it falls back to the deprecated [`mask(_:)`](https://developer.apple.com/documentation/swiftui/view/mask(_:)) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Image(systemName: "envelope.badge.fill")
    ///             .foregroundColor(Color.blue)
    ///             .font(.system(size: 128, weight: .regular))
    ///             .safeMask(alignment: .leading) {
    ///                 Rectangle().opacity(0.1)
    ///             }
    ///     }
    /// }
    /// ```
    ///
    public func safeMask<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ content: () -> Content
    ) -> some View {
        modifier(
            SafeMask(
                alignment: alignment,
                maskContent: content()
            )
        )
    }
}

private struct SafeMask<MaskContent: View>: ViewModifier {
    // MARK: - Inputs
    let alignment: Alignment
    let maskContent: MaskContent

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            applyMask(content)
        } else {
            applyDeprecatedMask(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeMask {
    @available(iOS 15.0, *)
    private func applyMask(_ content: Content) -> some View {
        content
            .mask(alignment: alignment) {
                maskContent
            }
    }

    @available(iOS, introduced: 13.0, deprecated: 15.0)
    private func applyDeprecatedMask(_ content: Content) -> some View {
        content
            .mask(deprecatedMaskContent)
    }

    private var deprecatedMaskContent: some View {
        maskContent
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: alignment
            )
    }
}
