//
//  ViewController.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Interfaces
import UIKit

class ViewController: UIViewController {
    var interfaces: Interfaces?

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        interfaces = appDelegate?.coreManager.interfaces
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
