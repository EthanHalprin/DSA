//
//  ARRRottenOrangesTester.swift
//  DSATests
//
//  Created by Ethan on 06/03/2021.
//

import XCTest
@testable import DSA

class ARRRottenOrangesTester: XCTestCase {

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
        /*
           0 1 1 2   >>>>>>>>   0 1 2 2   >>>>>>>>   0 2 2 2   >>>>>>>>   0 2 2 2    >>>>>>>>   0 2 2 2
           1 1 1 0              1 1 1 0              1 1 2 0              1 2 2 0               2 2 2 0
           1 1 1 1              1 1 1 2              1 1 2 2              1 2 2 2               2 2 2 2
           0 1 1 2              0 1 2 2              0 2 2 2              0 2 2 2               0 2 2 2
         */
        var matrix = [
                        // Row #1
                        [
                         FruitCell(row: 0, col: 0, condition: FruitCondition.missing),
                         FruitCell(row: 0, col: 1, condition: FruitCondition.ripe),
                         FruitCell(row: 0, col: 2, condition: FruitCondition.ripe),
                         FruitCell(row: 0, col: 3, condition: FruitCondition.rotten)
                        ],
                                   
                        // Row #2
                        [
                         FruitCell(row: 1, col: 0, condition: FruitCondition.ripe),
                         FruitCell(row: 1, col: 1, condition: FruitCondition.ripe),
                         FruitCell(row: 1, col: 2, condition: FruitCondition.ripe),
                         FruitCell(row: 1, col: 3, condition: FruitCondition.missing)
                        ],

                        // Row #3
                        [
                         FruitCell(row: 2, col: 0, condition: FruitCondition.ripe),
                         FruitCell(row: 2, col: 1, condition: FruitCondition.ripe),
                         FruitCell(row: 2, col: 2, condition: FruitCondition.ripe),
                         FruitCell(row: 2, col: 3, condition: FruitCondition.ripe)
                        ],

                        // Row #4
                        [
                         FruitCell(row: 3, col: 0, condition: FruitCondition.missing),
                         FruitCell(row: 3, col: 1, condition: FruitCondition.ripe),
                         FruitCell(row: 3, col: 2, condition: FruitCondition.ripe),
                         FruitCell(row: 3, col: 3, condition: FruitCondition.rotten)
                        ]
                      ]
        
        let timeToRote = QueueServices.shared.rottenTime(&matrix)
        
        XCTAssert(timeToRote == 4)
    }
    
    func testEmpty() throws {
        var empty = [[FruitCell]]()
        let timeToRote = QueueServices.shared.rottenTime(&empty)
        XCTAssert(timeToRote == 0)
    }

    func testFullyMissing() throws {
        var missing = [
                        // Row #1
                        [
                         FruitCell(row: 0, col: 0, condition: FruitCondition.missing),
                         FruitCell(row: 0, col: 1, condition: FruitCondition.missing),
                        ],
                                   
                        // Row #2
                        [
                         FruitCell(row: 1, col: 0, condition: FruitCondition.missing),
                         FruitCell(row: 1, col: 1, condition: FruitCondition.missing),
                        ]
        ]
        
        let timeToRote = QueueServices.shared.rottenTime(&missing)
        XCTAssert(timeToRote == 0)
    }

    func testFullyRiped() throws {
        var riped = [
                        // Row #1
                        [
                         FruitCell(row: 0, col: 0, condition: FruitCondition.ripe),
                         FruitCell(row: 0, col: 1, condition: FruitCondition.ripe),
                        ],
                                   
                        // Row #2
                        [
                         FruitCell(row: 1, col: 0, condition: FruitCondition.ripe),
                         FruitCell(row: 1, col: 1, condition: FruitCondition.ripe),
                        ]
        ]
        
        let timeToRote = QueueServices.shared.rottenTime(&riped)
        XCTAssert(timeToRote == 0)
    }
    
    func testFullyRotten() throws {
        var rotten = [
                        // Row #1
                        [
                         FruitCell(row: 0, col: 0, condition: FruitCondition.rotten),
                         FruitCell(row: 0, col: 1, condition: FruitCondition.rotten),
                        ],
                                   
                        // Row #2
                        [
                         FruitCell(row: 1, col: 0, condition: FruitCondition.rotten),
                         FruitCell(row: 1, col: 1, condition: FruitCondition.rotten),
                        ]
        ]
        
        let timeToRote = QueueServices.shared.rottenTime(&rotten)
        XCTAssert(timeToRote == 0)
    }
}
