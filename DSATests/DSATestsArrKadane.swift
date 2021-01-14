//
//  DSATests.swift
//  DSATests
//
//  Created by Ethan on 03/01/2021.
//

import XCTest
@testable import DSA

class DSATestsArrKadane: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation
        // of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation
        // of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce
        // the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        //self.measure {
            // Put the code you want to measure the time of here.
        //}
    }
    
    func testKadaneMix() throws {
        let input       = [-2, -3, 4, -1, -2, 1, 5 ,-3]
        let expectation = (7, 2, 6)
        let output = Arr.shared.kadane(input)
        XCTAssert(output != nil)
        XCTAssert(expectation == output!)
    }
    
    func testKadanePositive() throws {
        let input       = [5, 4, 3, 7, 5]
        let expectation = (24, 0, 4)
        let output = Arr.shared.kadane(input)
        XCTAssert(output != nil)
        XCTAssert(expectation == output!)
    }

    func testKadaneNegative() throws {
        let input       = [-2, -30, -4, -1]
        let expectation = (-1, 3, 3)
        let output = Arr.shared.kadane(input)
        XCTAssert(output != nil)
        XCTAssert(expectation == output!)
    }

    func testKadaneEmpty() throws {
        let input = [Int]()
        let output = Arr.shared.kadane(input)
        XCTAssert(output == nil)
    }

    func testKadaneSingleCell() throws {
        let input       = [100]
        let expectation = (100, 0, 0)
        let output = Arr.shared.kadane(input)
        XCTAssert(output != nil)
        XCTAssert(expectation == output!)
    }

    func testKadaneSingleEdgeMax() throws {
        let input       = [-1, 2, 30, -5, 10, -80, 100]
        let expectation = (100, 6, 6)
        let output = Arr.shared.kadane(input)
        XCTAssert(output != nil)
        XCTAssert(expectation == output!)
    }
}
