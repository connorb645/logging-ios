// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Logging",
  platforms: [
    .iOS(.v18)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "Logging",
      targets: ["Logging"])
  ],
  dependencies: [
    .package(url: "https://github.com/kean/Pulse.git", from: "5.1.4"),
    .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "Logging",
      dependencies: [
        .product(name: "Pulse", package: "Pulse"),
        .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
      ]
    ),
    .testTarget(
      name: "LoggingTests",
      dependencies: ["Logging"]
    ),
  ]
)
