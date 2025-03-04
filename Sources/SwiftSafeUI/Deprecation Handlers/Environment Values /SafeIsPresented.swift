//
//  SafeIsPresented.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUICore

extension EnvironmentValues {

    /// A Boolean value that indicates whether the view associated with this environment is currently presented.
    ///
    /// This environment value ensures compatibility across iOS versions:
    /// - On iOS 15 and later, it uses the new [`isPresented`](https://developer.apple.com/documentation/swiftui/environmentvalues/ispresented) property.
    /// - On earlier versions, it falls back to the [`presentationMode`](https://developer.apple.com/documentation/swiftui/environmentvalues/presentationmode) environment value isPresented variable.
    ///
    /// ## Apple Discussion
    /// This behaves differently than [`onAppear(perform:)`](https://developer.apple.com/documentation/swiftui/view/onappear(perform:)), which SwiftUI can call more than once for a given presentation, like when you navigate back to a view that’s already in the navigation hierarchy.
    ///
    /// To dismiss the currently presented view, use ``safeDismiss``.
    ///
    /// ## Example
    /// You can read this value like any of the other [`EnvironmentValues`](https://developer.apple.com/documentation/swiftui/environmentvalues) by creating a property with the [`Environment`](https://developer.apple.com/documentation/swiftui/environment) property wrapper:
    ///
    /// ```swift
    /// @Environment(\.safeIsPresented) private var safeIsPresented
    /// ```
    ///
    /// Read the value inside a view if you need to know when SwiftUI presents that view. For example, you can take an action when SwiftUI presents a view by using the ``SwiftUICore/View/safeOnChange(of:initial:_:)-35ola`` modifier:
    ///
    /// ```swift
    /// .safeOnChange(of: isPresented) { _, isPresented in
    ///     if isPresented {
    ///        // Do something when first presented.
    ///     }
    /// }
    /// ```
    public var safeIsPresented: Bool {
        if #available(iOS 15, *) {
            isPresented
        } else {
            presentationMode.wrappedValue.isPresented
        }
    }

}
