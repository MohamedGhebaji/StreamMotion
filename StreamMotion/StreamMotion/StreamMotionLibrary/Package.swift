// swift-tools-version: 5.9
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
        .library(name: "TestUtils", targets: ["TestUtils"]),
        .library(name: "Router", targets: ["Router"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
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
                "DesignSystem",
                "Router"
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
            dependencies: [
                "Domain",
                "Utils",
                "DesignSystem",
                "Router"
            ],
            path: "Sources/Features/VideoPlayerFeature"
        ),
        .target(
            name: "Utils"
        ),
        .target(
            name: "TestUtils",
            dependencies: ["Domain"]
        ),
        .target(name: "Router"),
        .target(
            name: "DesignSystem",
            resources: [
                .process("Resources/")
            ]
        ),
    ]
)
