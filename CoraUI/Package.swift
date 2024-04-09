// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "CoraUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoraUI",
            targets: ["CoraUI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoraUI",
            dependencies: [],
            resources: [
                .process("Resources/Assets.xcassets")
            ]),
        .testTarget(
            name: "CoraUITests",
            dependencies: ["CoraUI"]),
    ],
    swiftLanguageVersions: [.v5]
)
