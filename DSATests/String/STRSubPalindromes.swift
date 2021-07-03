//
//  STRSubPalindromes.swift
//  DSATests
//
//  Created by Ethan on 01/04/2021.
//

import XCTest
@testable import DSA


class STRSubPalindromes: XCTestCase {
    
    func testPalindromesFull() {

        let checked = "abcdedxgdnxxcxxzlm"
        let results = Str.shared.checkSubPalindromes(checked)

        XCTAssert(results.count == 3)
        XCTAssert(results[0].0 == 3  && results[0].1 == 5)
        XCTAssert(results[1].0 == 11 && results[1].1 == 13)
        XCTAssert(results[2].0 == 10 && results[2].1 == 14)
    }
    
    func testPalindromesEmpty() {
        let checked = ""
        let results = Str.shared.checkSubPalindromes(checked)
        
        XCTAssert(results.count == 0)
    }
}
