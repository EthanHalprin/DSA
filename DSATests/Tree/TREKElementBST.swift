//
//  TREKElementBST.swift
//  DSATests
//
//  Created by Ethan on 29/04/2021.
//

import XCTest
@testable import DSA


class TREKElementBST: XCTestCase {

    var rootBST: TNode?
    var stepper = 0
    
    override func setUpWithError() throws {
        self.rootBST = setupBST()
    }
    
    func testkElementEmpty() {
        XCTAssertNil(TreeUtils.shared.kElement(nil, k: 10, stepper: &self.stepper))
    }
    
    func testkElementFirst() {
        /*
           v
           15, 25, 30, 50, 65, 75, 100
         */
        let node = TreeUtils.shared.kElement(rootBST!, k: 1, stepper:&stepper)
        XCTAssert(node!.data == 15)
    }

    func testkElementRandom() {
        /*
                            v
           15, 25, 30, 50, 65, 75, 100
         */
        let node = TreeUtils.shared.kElement(rootBST!, k: 5, stepper:&stepper)
        XCTAssert(node!.data == 65)
    }
}

extension TREKElementBST {
    
    fileprivate func setupBST() -> TNode {
        
        let root = TNode()
        
        root.data = 50
        
        root.left = TNode()
        root.right = TNode()
        root.left!.data = 25
        root.right!.data = 75
        
        root.left!.left = TNode()
        root.left!.left!.data = 15
        root.left!.right = TNode()
        root.left!.right!.data = 30

        root.right!.left = TNode()
        root.right!.left!.data = 65
        root.right!.right = TNode()
        root.right!.right!.data = 100
        
        return root
    }
}
