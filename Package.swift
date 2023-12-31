// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LanScanner",
    platforms: [.iOS(.v13),.macOS(.v10_13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LanScanner",
            type: .static,
            targets: ["LanScanner"]),
        .library(name: "SwiftLanScanner",
                 type: .static,
                 targets: ["SwiftLanScanner"])
    ],
    dependencies:[],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LanScanner",
            resources: [.copy("Resources/data.plist")],
            publicHeadersPath: "include",
            cSettings: [.headerSearchPath("."), .headerSearchPath("Network Headers")]),
        .target(name: "SwiftLanScanner",
                dependencies: ["LanScanner"]),
        .testTarget(
            name: "LanScannerTests",
            dependencies: ["LanScanner", "SwiftLanScanner"]),
    ], cLanguageStandard: .gnu11
)
