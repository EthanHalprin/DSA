//
//  DSATestsStringAlgos.swift
//  DSATests
//
//  Created by Ethan on 27/01/2021.
//

import XCTest
@testable import DSA

class DSATestsStringAlgos: XCTestCase {

    func testKMP() throws {
        let res = kmp("ZXMABCFDEEO", pattern: "ABC")
        XCTAssert(res[0] == 3)
    }

}
