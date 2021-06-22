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
        self.tree = setupTree()
    }
    
    func testMirrorTree() {
        /*
            INPUT
         
                1
             2     3
           4  5  6  7
         */
        let _ = printTree(tree!)
        TreeUtils.shared.mirrorTree(&tree!)
        
        /*
            OUTPUT
                1
             3     2
           7  6  5  4
         */
        let result = printTree(tree!)
        XCTAssert(result == "1327654")
    }
}

extension TNode: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        let node = TNode()
        node.data = self.data
        node.left = self.left
        node.right = self.right
        return node
    }
}

extension TREMirror {
    
    fileprivate func printTree(_ root: TNode) -> String {
        
        let queue = Queue<TNode>()
        queue.enqueue(root)
        var output = String()
        
        while !queue.isEmpty() {
            let node = queue.dequeue()
            output.append(String(describing: "\(node.data)"))
            if let left = node.left   { queue.enqueue(left) }
            if let right = node.right { queue.enqueue(right)}
        }
        
        print("\(output)")
        return output
    }
    
    fileprivate func setupTree() -> TNode {
        
        let root = TNode()
        
        root.data = 1
        
        root.left = TNode()
        root.right = TNode()
        root.left!.data = 2
        root.right!.data = 3
        
        root.left!.left = TNode()
        root.left!.left!.data = 4
        root.left!.right = TNode()
        root.left!.right!.data = 5

        root.right!.left = TNode()
        root.right!.left!.data = 6
        root.right!.right = TNode()
        root.right!.right!.data = 7
        
        return root
    }
}
