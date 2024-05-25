//
//  SafeAutocapitalization.swift
//
//  GitHub Repo and Documentation: https://github.com/BaherTamer/SwiftSafeUI
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension View {
    /// 
    /// Applies autocapitalization to the text input, handling deprecation logic for different iOS versions.
    ///
    /// This modifier sets the autocapitalization style using the appropriate modifier based on the iOS version.
    ///
    /// If the device is running iOS 15.0 or later, it uses the [``textinputautocapitalization(_:)``](https://developer.apple.com/documentation/swiftui/view/textinputautocapitalization(_:)) modifier.
    /// For earlier versions, it falls back to the [``autocapitalization(_:)``](https://developer.apple.com/documentation/swiftui/view/autocapitalization(_:)) modifier.
    ///
    /// - Parameter style: The autocapitalization style to apply.
    ///
    /// - Returns: A view with the specified autocapitalization style applied to its text input.
    ///
    public func safeAutocapitalization(_ style: AutocapitalizationType) -> some View {
        modifier(SafeAutocapitalization(style: style))
    }
}

fileprivate struct SafeAutocapitalization: ViewModifier {
    let style: AutocapitalizationType
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .textInputAutocapitalization(style.modernValue)
        } else {
            content
                .autocapitalization(style.deprecatedValue)
        }
    }
}

/// A type that specifies the autocapitalization style for text input.
///
/// The `AutocapitalizationType` enum provides a unified way to handle different autocapitalization styles
/// across different iOS versions.
///
/// ## Cases:
///   - `sentences`: Capitalizes the first letter of each sentence.
///  - `words`: Capitalizes the first letter of each word.
///  - `characters`: Capitalizes all characters.
///  - `never`: Does not apply any autocapitalization.
public enum AutocapitalizationType {
    /// Capitalize the first letter of each sentence.
    case sentences
    /// Capitalize the first letter of each word.
    case words
    /// Capitalize all characters.
    case characters
    /// Do not apply any autocapitalization.
    case never
    
    @available(iOS 15.0, *)
    var modernValue: TextInputAutocapitalization {
        switch self {
        case .sentences: .sentences
        case .words: .words
        case .characters: .characters
        case .never: .never
        }
    }
    
    var deprecatedValue: UITextAutocapitalizationType {
        switch self {
        case .sentences: .sentences
        case .words: .words
        case .characters: .allCharacters
        case .never: .none
        }
    }
}
