//
//  ConcreteLogInterface.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

final class ConcreteLogInterface: LogInterface {
    func log(level: LogLevel, message: @autoclosure () -> String, file: String, function: String, line: Int) {
        print("[\(level)] \(message())")
    }
}
