// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "EasyUIBuilder",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "EasyUIBuilder",
            targets: ["EasyUIBuilder"]),
    ],
    dependencies: [
      .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
      .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        .target(
            name: "EasyUIBuilder",
            dependencies: ["SnapKit", "SwiftGenPlugin"],
            plugins: [
              .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "EasyUIBuilderTests",
            dependencies: ["EasyUIBuilder"]),
    ]
)
