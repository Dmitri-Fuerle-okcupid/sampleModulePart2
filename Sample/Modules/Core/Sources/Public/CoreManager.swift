//
//  CoreManager.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

final public class CoreManager {
    private let logInterface: ConcreteLogInterface
    private let networkInterface: ConcreteNetworkInterface
    private let routeInterface: ConcreteRouteInterface
    public let interfaces: Interfaces

    public init() {
        logInterface = .init()
        networkInterface = .init(logInterface: logInterface)
        routeInterface = .init()
        interfaces = ConcreteInterfaces(logInterface: logInterface, networkInterface: networkInterface, routeInterface: routeInterface)
    }

    public func add(routeRequestResponder: RouteRequestResponder) {
        routeInterface.add(routeRequestResponder: routeRequestResponder)
    }

    public func add(standardRouteRequestResponders: [StandardRouteResponder.Type]) {
        routeInterface.add(interfaces: interfaces, standardRouteRequestResponders: standardRouteRequestResponders)
    }
}
