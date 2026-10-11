// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BibliotecaCLI",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "BibliotecaCLI", targets: ["BibliotecaCLI"])
    ],
    targets: [
        .executableTarget(
            name: "BibliotecaCLI",
            path: "Sources/BibliotecaCLI"
        )
    ]
)
