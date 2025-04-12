//
//  SafeDismiss.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(iOS 13.0, macOS 10.15, *)
extension EnvironmentValues {

    /// An action that dismisses the current presentation.
    ///
    /// This environment value ensures compatibility across OS versions:
    /// - On iOS 15 and later, it uses the new [`dismiss()`](https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss) method.
    /// - On earlier versions, it falls back to the [`presentationMode`](https://developer.apple.com/documentation/swiftui/environmentvalues/presentationmode) environment value dismiss method.
    ///
    /// ## Apple Discussion
    /// Use this environment value to get the dismiss action instance for the current [`Environment`](https://developer.apple.com/documentation/swiftui/environment). Then call the instance to perform the dismissal. You call the instance directly because it defines a [`callAsFunction()`](https://developer.apple.com/documentation/swiftui/dismissaction/callasfunction()) method that Swift calls when you call the instance.
    ///
    /// You can use this action to:
    /// - Dismiss a modal presentation, like a sheet or a popover.
    /// - Pop the current view from a [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack).
    ///
    /// ## Example
    /// The specific behavior of the action depends on where you call it from. For example, you can create a button that calls the dismiss action inside a view that acts as a sheet:
    ///
    /// ```swift
    /// private struct SheetContents: View {
    ///     @Environment(\.safeDismiss) private var safeDismiss
    ///
    ///     var body: some View {
    ///         Button("Done") {
    ///             safeDismiss()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// When you present the `SheetContents` view, someone can dismiss the sheet by tapping or clicking the sheet’s button:
    ///
    /// ```swift
    /// private struct DetailView: View {
    ///     @State private var isSheetPresented = false
    ///
    ///     var body: some View {
    ///         Button("Show Sheet") {
    ///             isSheetPresented = true
    ///         }
    ///         .sheet(isPresented: $isSheetPresented) {
    ///            SheetContents()
    ///        }
    ///    }
    /// }
    /// ```
    ///
    /// Be sure that you define the action in the appropriate environment. For example, don’t reorganize the `DetailView` in the example above so that it creates the dismiss property and calls it from the [`sheet(item:onDismiss:content:)`](https://developer.apple.com/documentation/swiftui/view/sheet(item:ondismiss:content:)) view modifier’s content closure:
    ///
    /// ```swift
    /// private struct DetailView: View {
    ///     @State private var isSheetPresented = false
    ///     @Environment(\.safeDismiss) private var safeDismiss // Applies to DetailView.
    ///
    ///     var body: some View {
    ///         Button("Show Sheet") {
    ///             isSheetPresented = true
    ///         }
    ///         .sheet(isPresented: $isSheetPresented) {
    ///             Button("Done") {
    ///                 safeDismiss() // Fails to dismiss the sheet.
    ///            }
    ///        }
    ///     }
    /// }
    /// ```
    ///
    /// If you do this, the sheet fails to dismiss because the action applies to the environment where you declared it, which is that of the detail view, rather than the sheet.
    ///
    /// The dismiss action has no effect on a view that isn’t currently presented. If you need to query whether SwiftUI is currently presenting a view, read the ``safeIsPresented`` environment value.
    @MainActor
    public var safeDismiss: () -> Void {
        dismissAction
    }

}

// MARK: - Private Helpers
@available(iOS 13.0, macOS 10.15, *)
extension EnvironmentValues {

    /// Calls dismiss action based on OS versions.
    @MainActor
    private func dismissAction() {
        if #available(iOS 15.0, macOS 12.0, *) {
            dismiss()
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }

}
