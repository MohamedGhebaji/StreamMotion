// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StreamMotionLibrary",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Data", targets: ["Data"]),
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "VideoListFeature", targets: ["VideoListFeature"]),
        .library(name: "VideoPlayerFeature", targets: ["VideoPlayerFeature"]),
        .library(name: "Utils", targets: ["Utils"]),
        .library(name: "UI", targets: ["UI"]),
        .library(name: "TestUtils", targets: ["TestUtils"]),
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                "Utils"
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: [
                "Data",
                "TestUtils"
            ]
        ),
        .target(
            name: "Domain"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Domain",
                "TestUtils"
            ]
        ),
        .target(
            name: "VideoListFeature",
            dependencies: [
                "Domain",
                "Utils",
                "UI",
                "VideoPlayerFeature"
            ],
            path: "Sources/Features/VideoListFeature"
        ),
        .testTarget(
            name: "VideoListFeatureTests",
            dependencies: [
                "VideoListFeature",
                "Domain",
                "TestUtils"
            ],
            path: "Tests/Features/VideoListFeatureTests"
        ),
        .target(
            name: "VideoPlayerFeature",
            dependencies: ["Utils"],
            path: "Sources/Features/VideoPlayerFeature"
        ),
        .target(
            name: "Utils"
        ),
        .target(
            name: "UI"
        ),
        .target(
            name: "TestUtils",
            dependencies: ["Domain"]
        ),
    ]
)
