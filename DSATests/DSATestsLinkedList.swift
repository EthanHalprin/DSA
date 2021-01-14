//
//  DSATestsLL.swift
//  DSATests
//
//  Created by Ethan on 12/01/2021.
//

import XCTest
@testable import DSA

struct Stacker<T> {
    private var data = [T]()
    
    mutating func push(_ item: T) {
        data.append(item)
    }
    
    mutating func pop() -> T? {
        guard data.count > 0 else { return nil }
        return data.removeLast()
    }
}

class DSATestsLinkedList: XCTestCase {

    var head: LLNode?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation
        // of each test method in the class.
        self.head = LLNode()
        head!.data = 1
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
    
    func testEmptyLList() throws {
        XCTAssertNil(LinkedList.shared.reverse(nil))
    }
    
    func testSingleNodeLList() throws {
        let data = head!.data
        let reversed = LinkedList.shared.reverse(head)
        XCTAssert(data == reversed?.data)
    }
    
    func testMultiLList() {
        var allocator = LLNode()
        allocator.data = 1
        var original: LLNode? = allocator
        var stack = Stacker<Int>()
        stack.push(1)
        
        for i in 2..<11 {
            allocator.next = LLNode()
            allocator.next!.data = i
            stack.push(i)
            allocator = allocator.next!
        }
        
        allocator.next = nil
        var reversed = LinkedList.shared.reverse(original!)
        original = nil // since reverse func cannot "release"
        print("===============================================")
        print("  REVERSED")
        print("===============================================")
        dump(reversed!)
        
        while reversed != nil {
            XCTAssert(reversed!.data == stack.pop())
            reversed = reversed!.next
        }
    }

}
