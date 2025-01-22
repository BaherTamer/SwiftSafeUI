//
//  SafeIsPresented.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2024 Baher Tamer. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var safeIsPresented: Bool {
        if #available(iOS 15, *) {
            isPresented
        } else {
            presentationMode.wrappedValue.isPresented
        }
    }
}
