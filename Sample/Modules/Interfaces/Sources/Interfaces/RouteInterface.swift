//
//  RouteInterface.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit

/// The routes
public enum Route {
    /// feature a
    case featureA

    /// feature B
    case featureB
}

/// Interface used to make routing requests
public protocol RouteInterface {
    /// Requests a view controller for the route
    ///
    /// - Parameters:
    ///   - route: The route
    ///
    /// - Returns: The viewController for the route if a `RouteRequestResponder` was able to provide one
    func viewController(for route: Route) -> UIViewController?
}
