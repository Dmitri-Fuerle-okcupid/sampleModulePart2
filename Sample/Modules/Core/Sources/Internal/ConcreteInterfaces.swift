//
//  ConcreteInterfaces.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

struct ConcreteInterfaces: Interfaces {
    let logInterface: LogInterface
    let networkInterface: NetworkInterface
    let routeInterface: RouteInterface
}
