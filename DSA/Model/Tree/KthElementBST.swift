//
//  ddddd.swift
//  DSA
//
//  Created by Ethan on 29/04/2021.
//

import Foundation

/*
    Given a binary search tree, write a function
    kthSmallest to find the kth smallest element
    in it. (1 ≤ k ≤ BST's total elements)
*/

extension TreeUtils {
    
    func kElement(_ root: TNode?, k: Int, stepper: inout Int) -> TNode? {
        
        // Stopping Condtion
        guard root != nil else { return nil }
        guard !TreeUtils.isLeaf(root!) else {
            print("\(root!.data) ")
            stepper += 1
            if k == stepper { return root! }
            return nil
        }
        
        // Traverse
        if let resultInLeft = kElement(root!.left, k: k, stepper: &stepper) {
            return resultInLeft
        } else {
            print("\(root!.data) ")
            stepper += 1
            if k == stepper { return root! }
            if let resultInRight = kElement(root!.right, k: k, stepper: &stepper) {
                return resultInRight
            }
        }
        return nil
    }
}
