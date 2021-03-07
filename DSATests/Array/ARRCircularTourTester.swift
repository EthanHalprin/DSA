//
//  ARRCircularTourTester.swift
//  DSATests
//
//  Created by Ethan on 03/03/2021.
//

import XCTest
@testable import DSA

class ARRCircularTourTester: XCTestCase {

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
        let input = [ (4,6) , (6,5) , (7,3) , (4,5) ]
        let result = Arr.shared.circularTourist(input)
        
        switch result {
        case .success(let position):
            XCTAssert(position == 1)
        case .failure(let error):
            if error as! CircularTourError == CircularTourError.arrEmpty {
                print("ARRCircularTourTester ERROR: perceived as empty array")
                XCTFail()
            }
            if error as! CircularTourError == CircularTourError.arrSingleCity {
                print("ARRCircularTourTester ERROR: perceived as array with single cell")
                XCTFail()
            }
        }
    }
    
    func testEmpty() throws {
        switch Arr.shared.circularTourist([(Int, Int)]()) {
        case .success( _):
            XCTFail()
        case .failure(let error):
            if error as! CircularTourError == CircularTourError.arrEmpty {
                //OK
            }
            if error as! CircularTourError == CircularTourError.arrSingleCity {
                XCTFail()
            }
        }
    }

    func testSingle() throws {
        var input = [(Int, Int)]()
        input.append((2, 0))
        
        switch Arr.shared.circularTourist(input) {
        case .success( _):
            XCTFail()
        case .failure(let error):
            if error as! CircularTourError == CircularTourError.arrEmpty {
                XCTFail()
            }
            if error as! CircularTourError == CircularTourError.arrSingleCity {
                //OK
            }
        }
    }
}
