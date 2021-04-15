//
//  RouteRequestResponder.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit

/// Libraries can conform to this protocol to provide ViewController without explicitly writing a factory method
public protocol RouteRequestResponder {
    /// Used to provide viewControllers to the router.
    /// If this reponder can it will return the viewController for the route
    ///
    /// - Parameters:
    ///   - route: The route
    ///
    /// - Returns: The viewController for the route
    func viewController(for route: Route) -> UIViewController?
}
