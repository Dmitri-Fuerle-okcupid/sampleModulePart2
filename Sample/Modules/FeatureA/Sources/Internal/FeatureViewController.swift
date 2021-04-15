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
    let interfaces: Interfaces

    // MARK: - Init

    init(interfaces: Interfaces) {
        self.interfaces = interfaces
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Feature A"

        let featureAButton = UIButton(type: .custom)
        featureAButton.translatesAutoresizingMaskIntoConstraints = false
        featureAButton.setTitle("Feature A", for: .normal)
        featureAButton.backgroundColor = .black
        featureAButton.addTarget(self, action: #selector(featureATouched(_:)), for: .touchUpInside)

        let featureBButton = UIButton(type: .custom)
        featureBButton.translatesAutoresizingMaskIntoConstraints = false
        featureBButton.setTitle("Feature B", for: .normal)
        featureBButton.backgroundColor = .black
        featureBButton.addTarget(self, action: #selector(featureBTouched(_:)), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [featureAButton, featureBButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        view.backgroundColor = .green
        view.addSubview(stackView)

        let guide = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            featureAButton.heightAnchor.constraint(equalToConstant: 50),
            featureBButton.heightAnchor.constraint(equalToConstant: 50),

            stackView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        interfaces.logInterface.debug("Feature A - viewDidAppear")
    }

    // MARK: - Actions

    @IBAction func featureATouched(_ sender: UIButton) {
        guard let viewController = interfaces.routeInterface.viewController(for: .featureA) else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func featureBTouched(_ sender: UIButton) {
        guard let viewController = interfaces.routeInterface.viewController(for: .featureB) else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
