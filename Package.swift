// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Bond",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "Bond", targets: ["Bond"]),
        .library(name: "BondStatic", type: .static, targets: ["Bond"]),
        .library(name: "BondDynamic", type: .dynamic, targets: ["Bond"])
    ],
    dependencies: [
        .package(url: "https://github.com/npvisual/ReactiveKit.git", .branch("fix/spm-multilibs")),
        .package(url: "https://github.com/tonyarnold/Differ.git", .upToNextMajor(from: "1.4.3"))
    ],
    targets: [
        .target(name: "BNDProtocolProxyBase"),
        .target(name: "Bond", dependencies: ["BNDProtocolProxyBase", "ReactiveKit", "Differ"]),
        .target(name: "BondStatic", dependencies: ["BNDProtocolProxyBase", .product(name: "ReactiveKitStatic", package: "ReactiveKit"), "Differ"]),
        .target(name: "BondDynamic", dependencies: ["BNDProtocolProxyBase", .product(name: "ReactiveKitDynamic", package: "ReactiveKit"), "Differ"]),        
//         .target(name: "BondStatic", dependencies: ["BNDProtocolProxyBase", "ReactiveKitStatic", "Differ"]),
//         .target(name: "BondDynamic", dependencies: ["BNDProtocolProxyBase", "ReactiveKitDynamic", "Differ"]),
        .testTarget(name: "BondTests", dependencies: ["Bond", "ReactiveKit"])
    ]
)
