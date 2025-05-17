//
//  SafePresentationBackground.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
extension View {

    /// Sets the presentation background of the enclosing sheet to a custom view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 16.4, iPadOS 16.4, macOS 13.3**, and later, it utilizes the new [`presentationBackground(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/presentationbackground(alignment:content:)) method.
    /// - On earlier versions, it falls back to the [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack) with background removal and safe area handling workarounds.
    ///
    /// ## Apple Discussion
    /// The [`presentationBackground(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/presentationbackground(alignment:content:)) modifier differs from the [`background(alignment:content:)`](https://developer.apple.com/documentation/swiftui/view/background(alignment:content:)) modifier in several key ways.
    /// A presentation background:
    /// - Automatically fills the entire presentation.
    /// - Allows views behind the presentation to show through translucent areas of the `content`.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var showSettings = false
    ///
    ///     var body: some View {
    ///         Button("View Settings") {
    ///             showSettings = true
    ///         }
    ///         .sheet(isPresented: $showSettings) {
    ///             SettingsView()
    ///                 .safePresentationBackground {
    ///                     Color.yellow
    ///                 }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the implicit [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack) that groups the background views. The default is [`center`](https://developer.apple.com/documentation/swiftui/alignment/center).
    ///   - content: The view to use as the background of the presentation.
    @ViewBuilder
    nonisolated public func safePresentationBackground<Content: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if #available(iOS 16.4, macOS 13.3, *) {
            presentationBackground(
                alignment: alignment,
                content: content
            )
        } else {
            ZStack {
                self
            }
            .safeBackground(
                content: ClearModalBackgroundView.init
            )
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .safeBackground(
                alignment: alignment,
                content: content
            )
            .safeIgnoreSafeArea()
        }
    }

}

/// A `UIView` that clears the background color of its superview’s superview to prevent default modal backgrounds.
private struct ClearModalBackgroundView: UIViewRepresentable {
    private class BackgroundRemovalView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
    }

    func makeUIView(context: Context) -> UIView {
        BackgroundRemovalView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
