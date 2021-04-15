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
    name: "Interfaces",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Interfaces",
            type: .static,
            targets: ["Interfaces"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Interfaces",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "InterfacesTests",
            dependencies: ["Interfaces"])
    ]
)
