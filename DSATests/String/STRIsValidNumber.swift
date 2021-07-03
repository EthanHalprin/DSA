//
//  STRIsValidNumber.swift
//  DSATests
//
//  Created by Ethan on 01/04/2021.
//

import XCTest
@testable import DSA


class STRIsValidNumber: XCTestCase {

    func testValidNum() {
        XCTAssert(Str.shared.isValidNum("123.456789"))
    }

    func testEmptyNum() {
        XCTAssertFalse(Str.shared.isValidNum(""))
    }

}
