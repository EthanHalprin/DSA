//
//  ARRRottenOrangesTester.swift
//  DSATests
//
//  Created by Ethan on 06/03/2021.
//

import XCTest
@testable import DSA

class ARRMaxSubArray: XCTestCase {

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
        let results = Arr.shared.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -2, 400, -1, 3])
        XCTAssert(results!.0 == 406 && results!.1.0 == 3 && results!.1.1 == 10)
    }
    
    func testAllPositive() throws {
        let results = Arr.shared.maxSubArray([20, 15, 400, 60, 5])
        XCTAssert(results!.0 == 500 && results!.1.0 == 0 && results!.1.1 == 4)
    }

    func testNegateBeforeBig() throws {
        let results = Arr.shared.maxSubArray([-1, -2, -3, 400, 60, 40])
        XCTAssert(results!.0 == 500 && results!.1.0 == 3 && results!.1.1 == 5)
    }

    func testAssorted() throws {
        let results = Arr.shared.maxSubArray([-1, -2, -3, 400, 6, 5, -1, -100 , 90])
        XCTAssert(results!.0 == 411 && results!.1.0 == 3 && results!.1.1 == 5)
    }

    func testFullNegative() throws {
        let results = Arr.shared.maxSubArray([-10, -2, -13, -50])
        XCTAssert(results!.0 == -2 && results!.1.0 == 1 && results!.1.1 == 1)
    }

    func testSingle() throws {
        let results = Arr.shared.maxSubArray([-2])
        XCTAssert(results!.0 == -2 && results!.1.0 == 0 && results!.1.1 == 0)
    }
    
    func testEmpty() throws {
        let results = Arr.shared.maxSubArray([Int]())
        XCTAssertNil(results)
    }

}
