// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "swift-markdown-ui",
  platforms: [
    .macOS(.v11),
    .iOS(.v14),
    .tvOS(.v15),
    .macCatalyst(.v14),
    .watchOS(.v8),
  ],
  products: [
    .library(
      name: "MarkdownUI",
      targets: ["MarkdownUI"]
    ),
    .library(
      name: "MarkdownUI2",
      targets: ["MarkdownUI2"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/gonzalezreal/NetworkImage", from: "6.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0"),
  ],
  targets: [
    .target(
        name: "cmark-gfm",
        path: "Sources/cmark-gfm"
    ),
    .target(
      name: "MarkdownUI",
      dependencies: [
        "cmark-gfm",
        .product(name: "NetworkImage", package: "NetworkImage"),
      ]
    ),
    .target(
        name: "MarkdownUI2",
        exclude: [
            "Resources/main.js.LICENSE.txt"
        ],
        resources: [
            .copy("Resources/MarkdownView.bundle/styled.html"),
            .copy("Resources/MarkdownView.bundle/non_styled.html"),
            .copy("Resources/MarkdownView.bundle/main.js"),
            .copy("Resources/MarkdownView.bundle/main.css")
        ]
    ),
    .testTarget(
      name: "MarkdownUITests",
      dependencies: [
        "MarkdownUI",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
      exclude: ["__Snapshots__"]
    ),
  ]
)
