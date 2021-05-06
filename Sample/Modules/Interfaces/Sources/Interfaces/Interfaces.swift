//
//  Interface.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation

/// The interfaces that are used by modules to implement a feature
public protocol Interfaces {
    /// logInterface: Used for logging
    var logInterface: LogInterface { get }

    /// networkInterface: Used to make rest api requests
    var networkInterface: NetworkInterface { get }

    /// routeInterface: Used for routing
    var routeInterface: RouteInterface { get }
}

public protocol StandardRouteResponder: RouteRequestResponder {
    init(interfaces: Interfaces)
}
