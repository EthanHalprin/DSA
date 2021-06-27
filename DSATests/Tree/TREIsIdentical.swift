//
//  TREMirror.swift
//  DSATests
//
//  Created by Ethan on 22/06/2021.
//

import XCTest
@testable import DSA


class TREIsIdentical: XCTestCase {

    var tree1: TNode?
    var tree2: TNode?

    override func setUpWithError() throws {
        self.tree1 = TreeUtils.shared.setupTree()
        self.tree2 = TreeUtils.shared.setupTree()
    }
    
    func testOneNodedTree() {
        tree1 = TNode()
        tree1!.data = 123

        tree2 = TNode()
        tree2!.data = 123

        XCTAssert(TreeUtils.shared.isIdentical(tree1!, second: tree2!))
    }
    
    func testIdenticalTree() {
        XCTAssert(TreeUtils.shared.isIdentical(tree1!, second: tree2!))
    }
    
    func testUnIdenticalTree() {
        self.tree1 = TreeUtils.shared.setupTree(20)
        self.tree1 = TreeUtils.shared.setupTree(21)

        XCTAssertFalse(TreeUtils.shared.isIdentical(tree1!, second: tree2!))
    }
}
