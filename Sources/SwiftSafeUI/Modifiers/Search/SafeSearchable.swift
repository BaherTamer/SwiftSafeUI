//
//  SafeSearchable.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
extension View {
    ///
    /// Adds a search field to this view with customizable suggestions and prompt, ensuring compatibility with different iOS versions.
    ///
    /// - Parameters:
    ///   - text: A binding to the search text.
    ///   - placement: The placement of the search field. The default value is `.automatic`.
    ///   - prompt: A localized string to display as a placeholder in the search field.
    ///   - suggestions: A closure that returns the view used to display search suggestions.
    ///
    /// - Returns: A view that incorporates a searchable field with suggestions.
    ///
    /// This method provides a search functionality with suggestions for users. It adapts based on the iOS version:
    /// - On iOS 16 and later, it uses the new [`searchable(text:placement:prompt:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:)) method along with [`searchSuggestions(_:)`](https://developer.apple.com/documentation/swiftui/view/searchsuggestions(_:)).
    /// - On earlier versions, it falls back to the [`searchable(text:placement:prompt:suggestions:)`](https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:suggestions:)) method.
    ///
    /// > Important: This modifier requires iOS 15 or later.
    ///
    /// > Tip: The `searchable` functionality itself remains consistent across all supported iOS versions. This modifier specifically addresses the `searchSuggestions` feature on versions prior to iOS 16.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var searchText = ""
    ///
    ///     var body: some View {
    ///         List {
    ///             // List items...
    ///         }
    ///         .safeSearchable($searchText, prompt: "Search items") {
    ///             Text("🍎").searchCompletion("apple")
    ///             Text("🍐").searchCompletion("pear")
    ///             Text("🍌").searchCompletion("banana")
    ///         }
    ///     }
    /// }
    /// ```
    ///
    public nonisolated func safeSearchable<Suggestions: View>(
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: LocalizedStringKey,
        @ViewBuilder suggestions: () -> Suggestions
    ) -> some View {
        modifier(
            SafeSearchable(
                text: text,
                placement: placement,
                prompt: prompt,
                suggestions: suggestions()
            )
        )
    }
}

@available(iOS 15.0, *)
private struct SafeSearchable<Suggestions: View>: ViewModifier {
    // MARK: - Inputs
    @Binding var text: String
    let placement: SearchFieldPlacement
    let prompt: LocalizedStringKey
    let suggestions: Suggestions

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            applySearchableWithSuggestions(content)
        } else {
            applyDeprecatedSearchable(content)
        }
    }
}

// MARK: - Private Helpers
@available(iOS 15.0, *)
extension SafeSearchable {
    @available(iOS 16.0, *)
    private func applySearchableWithSuggestions(_ content: Content) -> some View {
        content
            .searchable(
                text: $text,
                placement: placement,
                prompt: prompt
            )
            .searchSuggestions {
                suggestions
            }
    }

    @available(iOS, introduced: 15.0, deprecated: 16.0)
    private func applyDeprecatedSearchable(_ content: Content) -> some View {
        content
            .searchable(
                text: $text,
                placement: placement,
                prompt: prompt,
                suggestions: { suggestions }
            )
    }
}
