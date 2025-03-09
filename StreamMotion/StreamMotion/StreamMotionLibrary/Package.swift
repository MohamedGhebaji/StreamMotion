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
    ],
    targets: [
        .target(name: "Data", dependencies: ["Domain", "Utils"]),
        .testTarget(name: "DataTests", dependencies: ["Data"]),
        .target(name: "Domain"),
        .testTarget(name: "DomainTests", dependencies: ["Domain"]),
        .target(name: "VideoListFeature", dependencies: ["Domain", "Utils", "UI", "VideoPlayerFeature"], path: "Sources/Features/VideoListFeature"),
        .testTarget(name: "VideoListFeatureTests", dependencies: ["VideoListFeature"], path: "Tests/Features/VideoListFeatureTests"),
        .target(name: "VideoPlayerFeature", dependencies: ["Utils"], path: "Sources/Features/VideoPlayerFeature"),
        .target(name: "Utils"),
        .target(name: "UI"),
    ]
)
