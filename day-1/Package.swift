// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day1",
    dependencies: [
        .package(path: "../AoCUtilities")
    ],
    targets: [
        .executableTarget(
                    name: "Day1",
                    dependencies: ["AoCUtilities"],
                    resources: [
                        .copy("Resources/inputs/example.txt"),
                        .copy("Resources/inputs/puzzle1.txt"),
                        .copy("Resources/inputs/puzzle2.txt"),
                    ]),
        .testTarget(
            name: "Day1Tests",
            dependencies: ["Day1"]),
    ]
)
