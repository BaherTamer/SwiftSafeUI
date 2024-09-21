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
    /// Applies a line limit to the current view, handling the logic for reserving space for different iOS versions.
    ///
    /// This modifier applies the line limit and reserves space using the appropriate method based on the iOS version.
    ///
    /// If the device is running iOS 16.0 or later,
    /// it uses the [``lineLimit(_:reservesSpace:)``](https://developer.apple.com/documentation/swiftui/view/linelimit(_:reservesspace:)) modifier.
    /// For earlier versions, it sets a fixed frame height to reserve space for the specified number of lines.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of lines for the text view.
    ///   - reservesSpace: A Boolean value indicating whether the view reserves space for the specified number of lines, even if fewer lines are displayed.
    ///
    public func safeLineLimit(
        _ limit: Int,
        reservesSpace: Bool
    ) -> some View {
        modifier(
            SafeLineLimit(
                limit: limit,
                reservesSpace: reservesSpace
            )
        )
    }
}

fileprivate struct SafeLineLimit: ViewModifier {
    // MARK: - Inputs
    let limit: Int
    let reservesSpace: Bool
    
    // MARK: - Variables
    @State private var height: CGFloat = TextHeightPreferenceKey.defaultValue
    
    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .lineLimit(limit, reservesSpace: reservesSpace)
        } else {
            content
                .lineLimit(limit)
                .background(geometryReader)
                .frame(height: reservesSpace ? height : nil, alignment: .top)
                .onPreferenceChange(TextHeightPreferenceKey.self) { height in
                    self.height = height * CGFloat(limit)
                }
        }
    }
    
    // MARK: - Private Helpers
    private var geometryReader: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(
                    key: TextHeightPreferenceKey.self,
                    value: geometry.size.height
                )
        }
    }
}

private struct TextHeightPreferenceKey: PreferenceKey {
    // MARK: - Variables
    static var defaultValue: CGFloat = 20

    // MARK: - Config Functions
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

