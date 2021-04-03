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

