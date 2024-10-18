//
//  SafeLineLimit.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension View {
    ///
    /// Sets the maximum number of lines for the view's text content, providing compatibility for the `reservesSpace` feature on older iOS versions.
    ///
    /// - Parameters:
    ///   - limit: The maximum number of lines for the view’s text. Use `0` for unlimited lines.
    ///   - reservesSpace: A `Bool` value indicating whether the text should reserve space for the specified number of lines, even if fewer lines are displayed.
    ///
    /// - Returns: A view that applies the line limit and space reservation based on the provided parameters.
    ///
    /// This modifier ensures that the `reservesSpace` functionality works across different iOS versions:
    /// - On iOS 16 and later, it uses the native [`lineLimit(_:reservesSpace:)`](https://developer.apple.com/documentation/swiftui/view/linelimit(_:reservesspace:)) method to reserve space as needed.
    /// - On earlier versions, it falls back to [`lineLimit(_:)`](https://developer.apple.com/documentation/swiftui/view/linelimit(_:)-513mb) and manually adjusts the view's height using a `GeometryReader` to mimic the `reservesSpace` behavior.
    ///
    /// > Tip: The `lineLimit` functionality itself remains consistent across all supported iOS versions. This modifier specifically addresses the `reservesSpace` feature on versions prior to iOS 16.
    ///
    /// ## Example
    /// ```swift
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Text("This is a multi-line text example.")
    ///             .safeLineLimit(2, reservesSpace: true)
    ///     }
    /// }
    /// ```
    ///
    public nonisolated func safeLineLimit(
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

private struct SafeLineLimit: ViewModifier {
    // MARK: - Inputs
    let limit: Int
    let reservesSpace: Bool

    // MARK: - Variables
    @State private var height: CGFloat = TextHeightPreferenceKey.defaultValue

    // MARK: - Body
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            applyReservesSpace(content)
        } else {
            applyDeprecatedReservesSpace(content)
        }
    }
}

// MARK: - Private Helpers
extension SafeLineLimit {
    @available(iOS 16.0, *)
    private func applyReservesSpace(_ content: Content) -> some View {
        content
            .lineLimit(limit, reservesSpace: reservesSpace)
    }

    @available(iOS, introduced: 13.0, deprecated: 16.0)
    private func applyDeprecatedReservesSpace(_ content: Content) -> some View {
        content
            .lineLimit(limit)
            .background(geometryReader)
            .frame(height: reservesSpace ? height : nil, alignment: .top)
            .onPreferenceChange(TextHeightPreferenceKey.self) { height in
                self.height = height * CGFloat(limit)
            }
    }

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

// MARK: - Text Height Preference Key
private struct TextHeightPreferenceKey: PreferenceKey {
    // MARK: Variables
    static var defaultValue: CGFloat = 20

    // MARK: Config Functions
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
