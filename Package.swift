// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "mach-platform-converter",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(name: "mach-platform-converter", targets: ["mach-platform-converter"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "mach-platform-converter",
            dependencies: [
                "lib-mach-platform-converter",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .target(
            name: "lib-mach-platform-converter",
            dependencies: []),
        .testTarget(
          name: "Tests",
          dependencies: ["lib-mach-platform-converter"],
          resources: [
            .copy("TestResources"),
          ])
    ]
)
