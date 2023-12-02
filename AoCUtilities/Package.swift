// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoCUtilities",
    products: [
        .library(
            name: "AoCUtilities",
            targets: ["AoCUtilities"]),
    ],
    targets: [
        .target(
            name: "AoCUtilities"),
        .testTarget(
            name: "AoCUtilitiesTests",
            dependencies: ["AoCUtilities"]),
    ]
)
