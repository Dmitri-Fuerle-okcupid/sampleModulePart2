//
//  ExampleEndpoint.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

struct ExampleEndpoint: Endpoint {
    let additionalHeaders: [String: String]?
    let path: String
    let method: HTTPMethod

    init() {
        additionalHeaders = nil
        path = "/"
        method = .get([])
    }
}
