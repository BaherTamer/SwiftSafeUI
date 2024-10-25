//
//  SafeNavigationStack.swift
//  SwiftSafeUI
//
//  Created by Baher Tamer on 18/10/2024.
//

import SwiftUI

///
/// A view that provides a navigation container for it's content, with support for different iOS versions.
///
/// This view enables you to create a navigation container, adapting based on the iOS version:
/// - On iOS 16 and later, it utilizes the new [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack) initializer [`init(root:)`](https://developer.apple.com/documentation/swiftui/navigationstack/init(root:)).
/// - On earlier versions, it falls back to the old [`NavigationView`](https://developer.apple.com/documentation/swiftui/navigationview) initializer [`init(content:)`](https://developer.apple.com/documentation/swiftui/navigationview/init(content:)) with the old [`navigationViewStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/navigationviewstyle(_:)) method.
///
/// > Tip: If your app exclusively supports iOS 16 or later, you do not need to use this modifier. You can directly use `NavigationStack` as this modifier primarily addresses the deprecation of `NavigationView` in earlier iOS versions.
///
/// ## Example
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         SafeNavigationStack {
///             VStack {
///                 Text("SwiftSafeUI")
///                 NavigationLink(
///                     "Documentation",
///                     destination: Text("Documentation View")
///                 )
///             }
///         }
///     }
/// }
/// ```
///
public struct SafeNavigationStack<Content: View>: View {
    // MARK: - Inputs
    private let content: Content
    
    // MARK: - Life Cycle
    ///
    /// Creates a new instance with the specified content, adapting to different iOS versions.
    ///
    /// - Parameter content: A closure that returns the content to be displayed within the navigation container.
    ///
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    public var body: some View {
        if #available(iOS 16.0, *) {
            navigationStack
        } else {
            navigationView
        }
    }
}

// MARK: - Private Helpers
extension SafeNavigationStack {
    @available(iOS 16.0, *)
    private var navigationStack: some View {
        NavigationStack {
            content
        }
    }

    @available(iOS, introduced: 13.0, deprecated: 16.0)
    private var navigationView: some View {
        NavigationView {
            content
        }
        .navigationViewStyle(.stack)
    }
}
