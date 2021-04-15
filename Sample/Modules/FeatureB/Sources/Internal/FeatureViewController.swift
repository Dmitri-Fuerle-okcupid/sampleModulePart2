//
//  FeatureViewController.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import UIKit
import Interfaces

final class FeatureViewController: UIViewController {
    var interfaces: Interfaces?

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Feature B"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        interfaces?.logInterface.debug("Feature B - viewDidAppear")
    }

    // MARK: - Actions

    @IBAction func featureATouched(_ sender: UIButton) {
        guard let viewController = interfaces?.routeInterface.viewController(for: .featureA) else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func featureBTouched(_ sender: UIButton) {
        guard let viewController = interfaces?.routeInterface.viewController(for: .featureB) else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
