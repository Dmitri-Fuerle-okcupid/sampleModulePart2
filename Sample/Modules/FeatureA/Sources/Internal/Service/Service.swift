//
//  Service.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

class Service {
    let networkInterface: NetworkInterface

    // MARK: - Init

    init(networkInterface: NetworkInterface) {
        self.networkInterface = networkInterface
    }

    // MARK: - Internal

    func exampleTest(completion: @escaping (Result<ExampleModel, Error>) -> Void) {
        let endpoint = ExampleEndpoint()
        networkInterface.task(endpoint: endpoint, type: ExampleModel.self) { result, _ in
            completion(result)
        }
    }
}
