// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day11",
    dependencies: [
        .package(path: "../AoCUtilities")
    ],
    targets: [
        .executableTarget(
                    name: "Day11",
                    dependencies: ["AoCUtilities"],
                    resources: [
                        .copy("Resources/inputs/example1.txt"),
                        .copy("Resources/inputs/example2.txt"),
                        .copy("Resources/inputs/input.txt"),
                    ]),
        .testTarget(
            name: "Day11Tests",
            dependencies: ["Day11"]),
    ]
)
