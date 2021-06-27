//
//  IsIdentical.swift
//  DSA
//
//  Created by Ethan on 27/06/2021.
//

import Foundation

extension TreeUtils {
    
    func isIdentical(_ root1: TNode, second root2: TNode) -> Bool {
        
        guard ((root1.left == nil && root2.left == nil) || (root1.left != nil && root2.left != nil)) else {
            return false
        }
        guard ((root1.right == nil && root2.right == nil) || (root1.right != nil && root2.right != nil)) else {
            return false
        }
        if TreeUtils.isLeaf(root1) && TreeUtils.isLeaf(root2) {
            return root1.data == root2.data
        } else {
            return root1.data == root2.data &&
                   isIdentical(root1.left!, second: root2.left!) &&
                   isIdentical(root1.right!, second: root2.right!)
        }
    }
    
}
