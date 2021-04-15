//
//  FeatureARouteRequestResponder.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit
import Interfaces

public final class FeatureARouteRequestResponder: StandardRouteResponder {
    let interfaces: Interfaces

    // MARK: - Init

    public init(interfaces: Interfaces) {
        self.interfaces = interfaces
    }
}

// MARK: - RouteRequestResponder

extension FeatureARouteRequestResponder: RouteRequestResponder {
    public func viewController(for route: Route) -> UIViewController? {
        switch route {
        case .featureA:
            return FeatureViewController(interfaces: interfaces)

        default:
            return nil
        }
    }
}
