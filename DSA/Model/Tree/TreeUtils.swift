//
//  TreeUtils.swift
//  DSA
//
//  Created by Ethan on 03/04/2021.
//

import Foundation

class TreeUtils {
    
    static var shared = TreeUtils()
    
    private init() {}
    static func isLeaf(_ node: TNode) -> Bool {
        return node.left == nil && node.right == nil 
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

extension TreeUtils {
    
    func printTree(_ root: TNode) -> String {
        
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
    
    func setupTree(_ rootData: Int = 1) -> TNode {
        
        let root = TNode()
        
        root.data = rootData
        
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
