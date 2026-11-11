// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "StockChart",
    platforms: [.iOS(.v16)],
    targets: [
        .executableTarget(
            name: "StockChart",
            path: "."
        )
    ]
)