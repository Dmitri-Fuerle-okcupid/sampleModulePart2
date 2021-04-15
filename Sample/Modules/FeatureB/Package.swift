// swift-tools-version:5.3
//
//  Package.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "FeatureB",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "FeatureB",
            type: .static,
            targets: ["FeatureB"])
    ],
    dependencies: [
        .package(url: "Interfaces", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "FeatureB",
            dependencies: ["Interfaces"],
            path: "Sources",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "FeatureBTests",
            dependencies: ["FeatureB"])
    ]
)
