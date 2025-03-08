//
//  SafeScrollView.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

/// A scrollable view.
///
/// This view ensures compatibility across OS versions:
/// - On iOS 16 and later, it utilizes the new [`ScrollView`](https://developer.apple.com/documentation/swiftui/scrollview) initializer [`init(_:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:content:)) with the new [`scrollIndicators(_:axes:)`](https://developer.apple.com/documentation/swiftui/view/scrollindicators(_:axes:)) method.
/// - On earlier versions, it falls back to the old [`ScrollView`](https://developer.apple.com/documentation/swiftui/scrollview) initializer [`init(_:showsIndicators:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:showsindicators:content:)).
///
/// ## Apple Discussion
/// The scroll view displays its content within the scrollable content region. As the user performs platform-appropriate scroll gestures, the scroll view adjusts what portion of the underlying content is visible. `ScrollView` can scroll horizontally, vertically, or both, but does not provide zooming functionality.
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         SafeScrollView(.vertical, showsIndicators: false) {
///             VStack(alignment: .leading) {
///                 ForEach(0..<100) {
///                     Text("Row \($0)")
///                 }
///             }
///         }
///     }
/// }
/// ```
@available(iOS 13.0, *)
public struct SafeScrollView<Content: View>: View {
    // MARK: - Inputs
    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let content: Content

    // MARK: - Life Cycle
    /// Creates a new instance that's scrollable in the direction of the given axis and can show indicators while scrolling.
    ///
    /// This initializer ensures compatibility across OS versions:
    /// - On iOS 16 and later, it utilizes the new [`ScrollView`](https://developer.apple.com/documentation/swiftui/scrollview) initializer [`init(_:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:content:)) with the new [`scrollIndicators(_:axes:)`](https://developer.apple.com/documentation/swiftui/view/scrollindicators(_:axes:)) method.
    /// - On earlier versions, it falls back to the old [`ScrollView`](https://developer.apple.com/documentation/swiftui/scrollview) initializer [`init(_:showsIndicators:content:)`](https://developer.apple.com/documentation/swiftui/scrollview/init(_:showsindicators:content:)).
    ///
    /// - Parameters:
    ///   - axes: The scroll view's scrollable axis. The default axis is the `.vertical` axis.
    ///   - showsIndicators: A Boolean value that indicates whether the scroll view displays the scrollable component of the content offset, in a way suitable for the platform. The default value for this parameter is `true`.
    ///   - content: The view builder that creates the scrollable view.
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
