//
//  SafeScrollView.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

///
/// A view that provides a scrollable container for its content, with support for different iOS versions.
///
/// This view enables you to create a scrollable area for your views, allowing you to specify the scroll axes and whether to show scroll indicators, adapting to the iOS version:
/// - On iOS 16 and later, it utilizes the new `ScrollView` initializer [`init(_:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:content:)) with the new [`scrollIndicators(_:axes:)`](https://developer.apple.com/documentation/swiftui/view/scrollindicators(_:axes:)) method.
/// - On earlier versions, it falls back to the old `ScrollView` initializer [`init(_:showsIndicators:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:showsindicators:content:)).
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         SafeScrollView(.vertical, showsIndicators: true) {
///             VStack(alignment: .leading) {
///                 ForEach(0..<100) {
///                     Text("Row \($0)")
///                 }
///             }
///         }
///     }
/// }
/// ```
///
public struct SafeScrollView<Content: View>: View {
    // MARK: - Inputs
    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let content: Content

    // MARK: - Life Cycle
    ///
    /// Creates a new instance with the specified axes and scroll indicator visibility, with support for different iOS versions.
    ///
    /// - Parameters:
    ///   - axes: The axes along which the scroll view can scroll. Default value is `.vertical`.
    ///   - showsIndicators: A `Bool` value indicating whether scroll indicators are shown. Default value is `true`.
    ///   - content: A closure that returns the content to be displayed within the scroll view.
    ///
    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content()
    }

    // MARK: - Body
    public var body: some View {
        if #available(iOS 16.0, *) {
            scrollView
        } else {
            deprecatedScrollView
        }
    }
}

// MARK: - Private Helpers
extension SafeScrollView {
    @available(iOS 16.0, *)
    private var scrollView: some View {
        ScrollView(axes) {
            content
        }
        .scrollIndicators(showsIndicators ? .automatic : .hidden)
    }

    @available(iOS, introduced: 13.0, deprecated: 16.0)
    private var deprecatedScrollView: some View {
        ScrollView(
            axes,
            showsIndicators: showsIndicators
        ) {
            content
        }
    }
}
