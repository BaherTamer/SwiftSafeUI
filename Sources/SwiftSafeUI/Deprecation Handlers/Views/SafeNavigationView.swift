//
//  SafeNavigationView.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

/// A view for presenting a stack of views that represents a visible path in a navigation hierarchy.
///
/// This view ensures compatibility across OS versions:
/// - On **iOS 16, macOS 13**, and later, it utilizes the new [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack) initializer [`init(root:)`](https://developer.apple.com/documentation/swiftui/navigationstack/init(root:)).
/// - On earlier versions, it falls back to the old [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview) initializer [`init(content:)`](https://developer.apple.com/documentation/swiftui/navigationview/init(content:)).
///
/// ## Apple Discussion
/// Use a `SafeNavigationView` to create a navigation-based app in which the user can traverse a collection of views. Users navigate to a destination view by selecting a [`NavigationLink`](https://developer.apple.com/documentation/swiftui/navigationlink) that you provide. On iPadOS and macOS, the destination content appears in the next column. Other platforms push a new view onto the stack, and enable removing items from the stack with platform-specific controls, like a Back button or a swipe gesture.
///
/// ## Example
/// Use the ``SafeNavigationView/init(content:)`` initializer to create a navigation view that directly associates navigation links and their destination views:
///
/// ```swift
/// SafeNavigationView {
///     List(model.notes) { note in
///         NavigationLink(
///             note.title,
///             destination: NoteEditor(id: note.id)
///         )
///     }
///
///     Text("Select a Note")
/// }
/// ```
///
/// > Tip: If your app exclusively supports iOS 16 or later, you do not need to use this view. You can directly use `NavigationStack` as this view primarily addresses the deprecation of `NavigationView` in earlier OS versions.
@available(iOS 13.0, macOS 10.15, *)
public struct SafeNavigationView<Content: View>: View {
    // MARK: - Inputs
    private let content: Content

    // MARK: - Life Cycle
    /// Creates a destination-based navigation view.
    ///
    /// This initializer ensures compatibility across OS versions:
    /// - On **iOS 16, macOS 13**, and later, it utilizes the new [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack) initializer [`init(root:)`](https://developer.apple.com/documentation/swiftui/navigationstack/init(root:)).
    /// - On earlier versions, it falls back to the old [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview) initializer [`init(content:)`](https://developer.apple.com/documentation/swiftui/navigationview/init(content:)).
    ///
    /// > Tip: If your app exclusively supports iOS 16 or later, you do not need to use this initializer. You can directly use `NavigationStack` as this initializer primarily addresses the deprecation of `NavigationView` in earlier OS versions.
    ///
    /// - Parameter content: A [`ViewBuilder`](https://developer.apple.com/documentation/swiftui/viewbuilder) that produces the content that the navigation view wraps. Any views after the first act as placeholders for corresponding columns in a multicolumn display.
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    // MARK: - Body
    public var body: some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            navigationStack
        } else {
            navigationView
        }
    }
}

// MARK: - Private Helpers
@available(iOS 13.0, macOS 10.15, *)
extension SafeNavigationView {
    @available(iOS 16.0, macOS 13.0, *)
    private var navigationStack: some View {
        NavigationStack {
            content
        }
    }

    @available(iOS, introduced: 13.0, deprecated: 16.0)
    @available(macOS, introduced: 10.15, deprecated: 13.0)
    private var navigationView: some View {
        NavigationView {
            content
        }
        .navigationViewStyle(.automatic)
    }
}
