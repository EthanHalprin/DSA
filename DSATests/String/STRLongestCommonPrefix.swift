//
//  STRLongestCommonPrefix.swift
//  DSATests
//
//  Created by Ethan on 01/04/2021.
//

import XCTest
@testable import DSA


class STRLongestCommonPrefix: XCTestCase {

    func testStringsFull() {
        
        var strings = [String]()
        
        strings.append("afcbvb")
        strings.append("afcbvx")
        strings.append("afcbv")
        strings.append("afc")
        strings.append("afcbvz")
                
        XCTAssert(Str.shared.maxCommonPrefix(strings) == "afc")
    }

    func testStringsEmpty() {
        XCTAssertNil(Str.shared.maxCommonPrefix([String]()))
    }

}
