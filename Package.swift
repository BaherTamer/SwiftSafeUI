// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSafeUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftSafeUI",
            targets: [
                "SwiftSafeUI"
            ]
        )
    ],
    targets: [
        .target(
            name: "SwiftSafeUI",
            swiftSettings: [
                .enableExperimentalFeature(
                    "StrictConcurrency=complete"
                )
            ]
        )
    ]
)
