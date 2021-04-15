//
//  ConcreteRouteInterface.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit
import Interfaces

final class ConcreteRouteInterface {
    private var routeRequestResponders: [RouteRequestResponder] = []

    // MARK: - Init

    init() {}

    // MARK: - Internal

    func add(routeRequestResponder: RouteRequestResponder) {
        routeRequestResponders.append(routeRequestResponder)
    }

    func add(interfaces: Interfaces, standardRouteRequestResponders: [StandardRouteResponder.Type]) {
        for responderType in standardRouteRequestResponders {
            let routeRequestResponder = responderType.init(interfaces: interfaces)
            add(routeRequestResponder: routeRequestResponder)
        }
    }
}

// MARK: - RoutingInterface

extension ConcreteRouteInterface: RouteInterface {
    func viewController(for route: Route) -> UIViewController? {
        for routeRequestResponder in routeRequestResponders {
            if let viewController = routeRequestResponder.viewController(for: route) {
                return viewController
            }
        }

        return nil
    }
}
