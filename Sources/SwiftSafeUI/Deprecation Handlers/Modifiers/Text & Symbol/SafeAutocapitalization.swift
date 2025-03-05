//
//  SafeAutocapitalization.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {

    /// Sets how often the shift key in the keyboard is automatically enabled.
    ///
    /// This method ensures compatibility across iOS versions:
    /// - On iOS 15 and later, it uses the [`textInputAutocapitalization(_:)`](https://developer.apple.com/documentation/swiftui/view/textinputautocapitalization(_:)) method.
    /// - On earlier versions, it falls back to the [`autocapitalization(_:)`](https://developer.apple.com/documentation/swiftui/view/autocapitalization(_:)) method.
    ///
    /// ## Apple Discussion
    /// Use `safeAutocapitalization(_:)` when you need to automatically capitalize words, sentences, or other text like proper nouns.
    ///
    /// The ``AutocapitalizationType`` enumeration defines the available autocapitalizing behavior. The default is `AutocapitalizationType.sentences`.
    ///
    /// ## Example
    /// In example below, as the user enters text the shift key is automatically enabled before every word:
    ///
    /// ```swift
    /// TextField("First, Last", text: $fullName)
    ///     .safeAutocapitalization(.words)
    /// ```
    ///
    /// - Parameter style: One of the capitalizing behaviors defined in the ``AutocapitalizationType`` enumeration.
    @ViewBuilder
    nonisolated public func safeAutocapitalization(
        _ style: AutocapitalizationType = .sentences
    ) -> some View {
        if #available(iOS 15.0, *) {
            textInputAutocapitalization(style.value)
        } else {
            autocapitalization(style.deprecatedValue)
        }
    }

}

/// The kind of autocapitalization behavior applied during text input.
///
/// This enum ensures compatibility across iOS versions:
/// - On iOS 15 and later, the enum maps to [`TextInputAutocapitalization`](https://developer.apple.com/documentation/swiftui/textinputautocapitalization).
/// - On earlier versions, it maps to [`UITextAutocapitalizationType`](https://developer.apple.com/documentation/uikit/uitextautocapitalizationtype).
///
/// ## Discussion
/// Pass an instance of `AutocapitalizationType` to the ``SwiftUICore/View/safeAutocapitalization(_:)`` view modifier.
public enum AutocapitalizationType {

    /// Defines an autocapitalizing behavior that will capitalize the first letter in every sentence.
    case sentences

    /// Defines an autocapitalizing behavior that will capitalize the first letter of every word.
    case words

    /// Defines an autocapitalizing behavior that will capitalize every letter.
    case characters

    /// Defines an autocapitalizing behavior that will not capitalize anything.
    case never

    @available(iOS 15.0, *)
    fileprivate var value: TextInputAutocapitalization {
        switch self {
        case .sentences: .sentences
        case .words: .words
        case .characters: .characters
        case .never: .never
        }
    }

    fileprivate var deprecatedValue: UITextAutocapitalizationType {
        switch self {
        case .sentences: .sentences
        case .words: .words
        case .characters: .allCharacters
        case .never: .none
        }
    }

}
