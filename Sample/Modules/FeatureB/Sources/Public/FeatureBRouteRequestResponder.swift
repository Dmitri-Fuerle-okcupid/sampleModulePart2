//
//  FeatureBRouteRequestResponder.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit
import Interfaces

public final class FeatureBRouteRequestResponder: StandardRouteResponder {
    let interfaces: Interfaces

    // MARK: - Init

    public init(interfaces: Interfaces) {
        self.interfaces = interfaces
    }
}

// MARK: - RouteRequestResponder

extension FeatureBRouteRequestResponder: RouteRequestResponder {
    public func viewController(for route: Route) -> UIViewController? {
        switch route {
        case .featureB:
            let storyboard = UIStoryboard(name: "FeatureViewController", bundle: .module)
            let viewController = storyboard.instantiateInitialViewController() as? FeatureViewController
            viewController?.interfaces = interfaces
            return viewController

        default:
            return nil
        }
    }
}
