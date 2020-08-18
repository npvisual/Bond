// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Bond",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "BondDynamic", type: .dynamic, targets: ["BondDynamic"]),
        .library(name: "Bond", targets: ["Bond"])
    ],
    dependencies: [
        .package(url: "https://github.com/npvisual/ReactiveKit.git", .branch("fix/spm-dynamic")),
        .package(url: "https://github.com/tonyarnold/Differ.git", .upToNextMajor(from: "1.4.3"))
    ],
    targets: [
        .target(name: "BNDProtocolProxyBase"),
        .target(name: "BondDynamic", dependencies: ["BNDProtocolProxyBase", "ReactiveKitDynamic", "Differ"]),
        .target(name: "Bond", dependencies: ["BNDProtocolProxyBase", "ReactiveKit", "Differ"]),
        .testTarget(name: "BondTests", dependencies: ["Bond", "ReactiveKit"])
    ]
)
