// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "WithdeskSDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "WithdeskSDK",
            targets: ["WithdeskSDKWrapper"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/socketio/socket.io-client-swift.git", from: "16.1.1")
    ],
    targets: [
        .binaryTarget(
            name: "WithdeskSDKBinary",
            path: "./WithdeskSDK.xcframework"
        ),
        .target(
            name: "WithdeskSDKWrapper",
            dependencies: [
                "WithdeskSDKBinary",
                .product(name: "SocketIO", package: "socket.io-client-swift"),
            ],
            path: "Sources/WithdeskSDKWrapper"
        ),
    ]
)
