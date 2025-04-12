//
//  SafeOnChange.swift
//
//  GitHub Repository: https://github.com/BaherTamer/SwiftSafeUI
//  Documentation: https://bahertamer.github.io/SwiftSafeUI/
//
//  Copyright © 2025 Baher Tamer. All rights reserved.
//

import SwiftUICore

@available(iOS 14.0, macOS 11.0, *)
extension View {

    /// Adds a modifier for this view that fires an action when a specific value changes.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 17, iPadOS 17, macOS 14**, and later, it utilizes the new [`onChange(of:initial:_:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-8wgw9) method.
    /// - On earlier versions, it falls back to the [`onChange(of:perform:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)) method.
    ///
    /// ## Apple Discussion
    /// You can use `safeOnChange` to trigger a side effect as the result of a value changing, such as an `Environment` key or a `Binding`.
    ///
    /// The system may call the action closure on the main actor, so avoid long-running tasks in the closure. If you need to perform such tasks, detach an asynchronous background task.
    ///
    /// When the value changes, the new version of the closure will be called, so any captured values will have their values from the time that the observed value has its new value.
    ///
    /// ## Example
    /// In the following code example, `PlayerView` calls into its model when `playState` changes model.
    ///
    /// ```swift
    /// struct PlayerView: View {
    ///     var episode: Episode
    ///     @State private var playState: PlayState = .paused
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(episode.title)
    ///             Text(episode.showTitle)
    ///             PlayButton(playState: $playState)
    ///         }
    ///         .safeOnChange(of: playState) {
    ///             model.playStateDidChange(state: playState)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// > Important: This modifier requires **iOS 14, iPadOS 14 , and macOS 11** or later.
    ///
    /// - Parameters:
    ///   - value: The value to check against when determining whether to run the closure.
    ///   - initial: Whether the action should be run when this view initially appears.
    ///   - action: A closure to run when the value changes.
    ///
    /// - Returns: A view that fires an action when the specified value changes.
    @ViewBuilder
    nonisolated public func safeOnChange<Value: Equatable>(
        of value: Value,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View {
        if #available(iOS 17.0, macOS 14.0, *) {
            onChange(
                of: value,
                initial: initial,
                action
            )
        } else {
            self
                .onAppear {
                    if initial {
                        action()
                    }
                }
                .onChange(of: value) { _ in
                    action()
                }
        }
    }


    /// Adds a modifier for this view that fires an action when a specific value changes.
    ///
    /// This method ensures compatibility across OS versions:
    /// - On **iOS 17, iPadOS 17, macOS 14**, and later, it utilizes the new [`onChange(of:initial:_:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-4psgg) method.
    /// - On earlier versions, it falls back to the [`onChange(of:perform:)`](https://developer.apple.com/documentation/swiftui/view/onchange(of:perform:)) method.
    ///
    /// ## Apple Discussion
    /// You can use `safeOnChange` to trigger a side effect as the result of a value changing, such as an `Environment` key or a `Binding`.
    ///
    /// The system may call the action closure on the main actor, so avoid long-running tasks in the closure. If you need to perform such tasks, detach an asynchronous background task.
    ///
    /// When the value changes, the new version of the closure will be called, so any captured values will have their values from the time that the observed value has its new value. The old and new observed values are passed into the closure.
    ///
    /// ## Example
    /// In the following code example, `PlayerView` passes both the old and new values to the model.
    ///
    /// ```swift
    /// struct PlayerView: View {
    ///     var episode: Episode
    ///     @State private var playState: PlayState = .paused
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(episode.title)
    ///             Text(episode.showTitle)
    ///             PlayButton(playState: $playState)
    ///         }
    ///         .onChange(of: playState) { oldState, newState in
    ///             model.playStateDidChange(from: oldState, to: newState)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// > Important: This modifier requires **iOS 14, iPadOS 14 , and macOS 11** or later.
    ///
    /// - Parameters:
    ///   - value: The value to check against when determining whether to run the closure.
    ///   - initial: Whether the action should be run when this view initially appears.
    ///   - action: A closure to run when the value changes.
    ///
    /// - Returns: A view that fires an action when the specified value changes.
    @ViewBuilder
    nonisolated public func safeOnChange<Value: Equatable>(
        of value: Value,
        initial: Bool = false,
        _ action: @escaping (Value, Value) -> Void
    ) -> some View {
        if #available(iOS 17.0, macOS 14.0, *) {
            onChange(
                of: value,
                initial: initial,
                action
            )
        } else {
            self
                .onAppear {
                    if initial {
                        action(value, value)
                    }
                }
                .onChange(of: value) { [value] newValue in
                    action(value, newValue)
                }
        }
    }

}
