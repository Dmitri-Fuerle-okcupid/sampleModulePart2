//
//  FeatureATests.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Interfaces
import XCTest

@testable import FeatureA

final class FeatureATests: XCTestCase {
    func testExample() {
        // Given
        let networkInterface = MockNetworkInterface()
        let testResult = ExampleModel(string: "TEST")
        networkInterface.nextResult = testResult
        let service = Service(networkInterface: networkInterface)

        // When
        let testExpectation = expectation(description: "expectation")
        var resultModel: ExampleModel?
        service.exampleTest { result in
            switch result {
            case .failure: ()
            case .success(let model):
                resultModel = model
            }

            testExpectation.fulfill()
        }

        // Then
        wait(for: [testExpectation], timeout: 5)
        XCTAssertEqual(testResult.string, resultModel?.string)
    }
}
