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
    name: "Core",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Core",
            type: .static,
            targets: ["Core"])
    ],
    dependencies: [
        .package(url: "Interfaces", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: ["Interfaces"],
            path: "Sources"),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"])
    ]
)
