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
      .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0"),
      .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
    ],
    targets: [
        .target(
            name: "EasyUIBuilder",
            dependencies: [
              "SnapKit",
              "SwiftGenPlugin",
              .product(name: "Lottie", package: "lottie-spm")
            ]
        ),
        .testTarget(
            name: "EasyUIBuilderTests",
            dependencies: ["EasyUIBuilder"]),
    ]
)
