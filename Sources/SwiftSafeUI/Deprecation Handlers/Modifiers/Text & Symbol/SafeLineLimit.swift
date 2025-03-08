//
//  SafeLineLimit.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(*, deprecated, message: "Due to an incorrect approach used for height calculation of text in dynamic large text cases, this modifier should no longer be used as it does not work as expected.")
extension View {

    /// Sets a limit for the number of lines text can occupy in this view.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On iOS 16 and later, it uses the native [`lineLimit(_:reservesSpace:)`](https://developer.apple.com/documentation/swiftui/view/linelimit(_:reservesspace:)) method to reserve space as needed.
    /// - On earlier versions, it falls back to [`lineLimit(_:)`](https://developer.apple.com/documentation/swiftui/view/linelimit(_:)-513mb) and manually adjusts the view's height using a `GeometryReader` to mimic the `reservesSpace` behavior.
    ///
    /// ## Example
    /// ```swift
    /// GroupBox {
    ///     Text("Title")
    ///         .font(.headline)
    ///         .lineLimit(2, reservesSpace: true)
    ///
    ///     Text("Subtitle")
    ///         .font(.subheadline)
    ///         .lineLimit(4, reservesSpace: true)
    /// }
    /// ```
    ///
    /// > Note: The `lineLimit` functionality itself remains consistent across all supported OS versions. This modifier specifically addresses the `reservesSpace` feature on versions prior to iOS 16.
    ///
    /// > Warning: This modifier should **not** be used as the height calculation for dynamic large text is not working as expected. Issues arise with dynamically adjusted text heights, especially with larger accessibility sizes and custom text settings.
    ///
    /// - Parameters:
    ///   - limit: The line limit.
    ///   - reservesSpace: Whether text reserves space so that it always occupies the height required to display the specified number of lines.
    nonisolated public func safeLineLimit(
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

    // MARK: - States
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
                DispatchQueue.main.async {
                    self.height = height * CGFloat(limit)
                }
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
    // MARK: Constants
    static let defaultValue: CGFloat = 20

    // MARK: Config Functions
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
