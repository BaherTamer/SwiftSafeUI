//
//  SafeSearchable.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
extension View {

    /// Marks this view as searchable, which configures the display of a search field.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 16, macOS 13**, and later, it uses the new [`searchable(text:placement:prompt:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:)) method along with [`searchSuggestions(_:)`](https://developer.apple.com/documentation/swiftui/view/searchsuggestions(_:)).
    /// - On earlier versions, it falls back to the [`searchable(text:placement:prompt:suggestions:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:suggestions:)) method.
    ///
    /// ## Apple Discussion
    /// For more information about using searchable modifiers, see [Adding a search interface to your app](https://developer.apple.com/documentation/swiftui/adding-a-search-interface-to-your-app)
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var searchText = ""
    ///     private var searchPrompt: Text?
    ///
    ///     var body: some View {
    ///         List {
    ///             // List items...
    ///         }
    ///         .safeSearchable($searchText, prompt: searchPrompt) {
    ///             Text("🍎").searchCompletion("apple")
    ///             Text("🍐").searchCompletion("pear")
    ///             Text("🍌").searchCompletion("banana")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// > Note: The `searchable` functionality itself remains consistent across all supported OS versions. This modifier specifically addresses the `searchSuggestions` feature on versions prior to **iOS 16 and macOS 13**.
    ///
    /// > Important: This modifier requires **iOS 15 and macOS 12** or later.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the containing view hierarchy.
    ///   - prompt: A [`Text`](https://developer.apple.com/documentation/swiftui/text) view representing the prompt of the search field which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that populates a list of suggestions.
    @ViewBuilder
    nonisolated public func safeSearchable<Suggestions: View>(
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: Text? = nil,
        @ViewBuilder suggestions: () -> Suggestions
    ) -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            self
                .searchable(
                    text: text,
                    placement: placement,
                    prompt: prompt
                )
                .searchSuggestions(suggestions)
        } else {
            searchable(
                text: text,
                placement: placement,
                prompt: prompt,
                suggestions: suggestions
            )
        }
    }


    /// Marks this view as searchable, which configures the display of a search field.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 16, macOS 13**, and later, it uses the new [`searchable(text:placement:prompt:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:)) method along with [`searchSuggestions(_:)`](https://developer.apple.com/documentation/swiftui/view/searchsuggestions(_:)).
    /// - On earlier versions, it falls back to the [`searchable(text:placement:prompt:suggestions:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:suggestions:)) method.
    ///
    /// ## Apple Discussion
    /// For more information about using searchable modifiers, see [Adding a search interface to your app](https://developer.apple.com/documentation/swiftui/adding-a-search-interface-to-your-app)
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var searchText = ""
    ///     private let searchPrompt: LocalizedStringKey = "Search items"
    ///
    ///     var body: some View {
    ///         List {
    ///             // List items...
    ///         }
    ///         .safeSearchable($searchText, prompt: searchPrompt) {
    ///             Text("🍎").searchCompletion("apple")
    ///             Text("🍐").searchCompletion("pear")
    ///             Text("🍌").searchCompletion("banana")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// > Important: This modifier requires **iOS 15 and macOS 12** or later.
    ///
    /// > Note: The `searchable` functionality itself remains consistent across all supported OS versions. This modifier specifically addresses the `searchSuggestions` feature on versions prior to **iOS 16 and macOS 13**.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the containing view hierarchy.
    ///   - prompt: A key for the localized prompt of the search field which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that populates a list of suggestions.
    @ViewBuilder
    nonisolated public func safeSearchable<Suggestions: View>(
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: LocalizedStringKey,
        @ViewBuilder suggestions: () -> Suggestions
    ) -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            self
                .searchable(
                    text: text,
                    placement: placement,
                    prompt: prompt
                )
                .searchSuggestions(suggestions)
        } else {
            searchable(
                text: text,
                placement: placement,
                prompt: prompt,
                suggestions: suggestions
            )
        }
    }


    /// Marks this view as searchable, which configures the display of a search field.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 16, macOS 13**, and later, it uses the new [`searchable(text:placement:prompt:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:)) method along with [`searchSuggestions(_:)`](https://developer.apple.com/documentation/swiftui/view/searchsuggestions(_:)).
    /// - On earlier versions, it falls back to the [`searchable(text:placement:prompt:suggestions:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:suggestions:)) method.
    ///
    /// ## Apple Discussion
    /// For more information about using searchable modifiers, see [Adding a search interface to your app](https://developer.apple.com/documentation/swiftui/adding-a-search-interface-to-your-app)
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var searchText = ""
    ///     private let searchPrompt = "Search items"
    ///
    ///     var body: some View {
    ///         List {
    ///             // List items...
    ///         }
    ///         .safeSearchable($searchText, prompt: searchPrompt) {
    ///             Text("🍎").searchCompletion("apple")
    ///             Text("🍐").searchCompletion("pear")
    ///             Text("🍌").searchCompletion("banana")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// > Important: This modifier requires **iOS 15 and macOS 12** or later.
    ///
    /// > Note: The `searchable` functionality itself remains consistent across all supported OS versions. This modifier specifically addresses the `searchSuggestions` feature on versions prior to **iOS 16 and macOS 13**.
    ///
    /// - Parameters:
    ///   - text: The text to display and edit in the search field.
    ///   - placement: The preferred placement of the search field within the containing view hierarchy.
    ///   - prompt: A string representing the prompt of the search field which provides users with guidance on what to search for.
    ///   - suggestions: A view builder that produces content that populates a list of suggestions.
    @ViewBuilder
    nonisolated public func safeSearchable<
        Suggestions: View,
        Prompt: StringProtocol
    >(
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: Prompt,
        @ViewBuilder suggestions: () -> Suggestions
    ) -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            self
                .searchable(
                    text: text,
                    placement: placement,
                    prompt: prompt
                )
                .searchSuggestions(suggestions)
        } else {
            searchable(
                text: text,
                placement: placement,
                prompt: prompt,
                suggestions: suggestions
            )
        }
    }

}
