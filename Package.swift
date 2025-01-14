// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlyreelPanorama",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FlyreelPanorama",
            targets: ["FlyreelPanorama"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "FlyreelPanorama",
            path: "FlyreelPanorama.xcframework"
        )
    ]
)
