//
//  DSATestsArrStockSpan.swift
//  DSATests
//
//  Created by Ethan on 14/01/2021.
//

import XCTest
@testable import DSA

class DSATestsArrStockSpan: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        //  self.measure {
              // Put the code you want to measure the time of here.
        //  }
    }

    func testFull() throws {
        let input       = [100, 80, 60, 70, 60, 75, 85]
        let expectation = [1,   1,  1,  2,  1,  4,  6 ]
        
        if let output = Arr.shared.stockSpan(input) {
            dump(output)
            XCTAssert(output == expectation)
        } else {
            XCTAssert(false)
        }
    }
    
    func testEmpty() throws {
        let output = Arr.shared.stockSpan([Int]())
        XCTAssert(output == nil)
    }

    func testSingle() throws {
        let input       = [285]
        let expectation = [1]

        if let output = Arr.shared.stockSpan(input) {
            XCTAssert(expectation == output)
        }
    }
}
