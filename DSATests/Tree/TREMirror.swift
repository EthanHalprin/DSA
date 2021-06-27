//
//  TREMirror.swift
//  DSATests
//
//  Created by Ethan on 22/06/2021.
//

import XCTest
@testable import DSA


class TREMirror: XCTestCase {

    var tree: TNode?
    
    override func setUpWithError() throws {
        self.tree = TreeUtils.shared.setupTree()
    }
    
    func testMirrorTree() {
        /*
            INPUT
         
                1
             2     3
           4  5  6  7
         */
        let _ = TreeUtils.shared.printTree(tree!)
        TreeUtils.shared.mirrorTree(&tree!)
        
        /*
            OUTPUT
                1
             3     2
           7  6  5  4
         */
        let result = TreeUtils.shared.printTree(tree!)
        XCTAssert(result == "1327654")
    }
}

