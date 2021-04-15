//
//  FeatureATests.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import XCTest
@testable import FeatureA

final class FeatureATests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FeatureA().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
