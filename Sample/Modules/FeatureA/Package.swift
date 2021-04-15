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
    name: "FeatureA",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "FeatureA",
            type: .static,
            targets: ["FeatureA"])
    ],
    dependencies: [
        .package(url: "Interfaces", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "FeatureA",
            dependencies: ["Interfaces"],
            path: "Sources"),
        .testTarget(
            name: "FeatureATests",
            dependencies: ["FeatureA"])
    ]
)
