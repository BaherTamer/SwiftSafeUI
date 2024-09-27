//
//  SafeAutocapitalization.swift
//
//  GitHub Repo & Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    ///
    /// Applies autocapitalization behavior to a text input view, supporting different iOS versions.
    ///
    /// - Parameters:
    ///   - style: The autocapitalization style to apply, represented by the ``AutocapitalizationType`` enum.
    ///
    /// - Returns: A view that modifies the autocapitalization behavior based on the provided style.
    ///
    /// This method enables applying an autocapitalization style to text input fields in SwiftUI, with backward compatibility for different iOS versions:
    /// - On iOS 15 and later, it uses the [`textInputAutocapitalization(_:)`](https://developer.apple.com/documentation/swiftui/view/textinputautocapitalization(_:)) method.
    /// - On earlier versions, it falls back to the [`autocapitalization(_:)`](https://developer.apple.com/documentation/swiftui/view/autocapitalization(_:)) method.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var fullName = ""
    ///
    ///     var body: some View {
    ///         TextField("Enter your full name", text: $fullName)
    ///             .safeAutocapitalization(.words)
    ///     }
    /// }
    /// ```
    ///
    public func safeAutocapitalization(_ style: AutocapitalizationType) -> some View {
        modifier(
            SafeAutocapitalization(style: style)
        )
    }
}

fileprivate struct SafeAutocapitalization: ViewModifier {
    // MARK: - Inputs
    let style: AutocapitalizationType
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            applyAutocapitalization(content)
        } else {
            applyDeprecatedAutocapitalization(content)
        }
    }
}

// MARK: - Private Helpers
fileprivate extension SafeAutocapitalization {
    @available(iOS 15.0, *)
    private func applyAutocapitalization(_ content: Content) -> some View {
        content
            .textInputAutocapitalization(style.value)
    }
    
    @available(iOS, introduced: 13.0, deprecated: 15.0)
    private func applyDeprecatedAutocapitalization(_ content: Content) -> some View {
        content
            .autocapitalization(style.deprecatedValue)
    }
}

///
/// A representation of different autocapitalization styles available for text input views.
///
/// This enum encapsulates the various autocapitalization options, with support for different iOS versions:
/// - On iOS 15 and later, the enum maps to [`TextInputAutocapitalization`](https://developer.apple.com/documentation/swiftui/textinputautocapitalization).
/// - On earlier versions, it maps to [`UITextAutocapitalizationType`](https://developer.apple.com/documentation/uikit/uitextautocapitalizationtype).
///
public enum AutocapitalizationType {
    /// Automatically capitalize the first letter of each sentence.
    case sentences
    
    /// Automatically capitalize the first letter of each word.
    case words
    
    /// Automatically capitalize all characters.
    case characters
    
    /// Disable autocapitalization entirely.
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
