//
//  LeaveNumber.swift
//  DSA
//
//  Created by Ethan on 03/04/2021.
//

import Foundation


/*
    Input: 5
    Tree: (Full)
 
          6
      4       3
    1   2   7   8
   5 6 8 3 4 9 1 2
 
    Output: pointer to leaf that carries "4" data (since it's the 5th in line of leafs)
 
    My algo: 1- Count the leafs
             2- Invoke function with a range. Each junction split
                divide the range into two - left part to left turn
                and middle till right for a right turn
             3- When encountering a leaf, your range should be of size 2
                and from there - decree left/right with comparisho to input
 */

class TNode {
    var data = 0
    var left: TNode?
    var right: TNode?
}

extension TreeUtils {
    
    func getNthLeaf(in root: TNode?, number n: Int) -> TNode? {
        guard root != nil else { return nil }
       
        let leafsNum = countLeafs(root!)
        let nthLeaf = getNthLeaf(root: root!, n: n, limits: (1, leafsNum))
        
        return nthLeaf
    }

    private func getNthLeaf(root: TNode?, n: Int, limits: (Int, Int)) -> TNode? {
        guard root != nil else { return nil }
        guard TreeUtils.isLeaf(root!) else {
            if limits.1 - limits.0 != 2 {
                fatalError("Bad tuple partioning")
            }
            if n == limits.0 {
                return root!.left
            } else if n == limits.1 {
                return root!.right
            } else {
                fatalError("Bad tuple arrangement")
            }
        }
        
        if let left = getNthLeaf(root: root!.left, n: n, limits: (limits.0, (limits.1 - limits.0) / 2)) {
            return left
        } else if let right = getNthLeaf(root: root!.left, n: n, limits: (((limits.1 - limits.0) / 2) + 1, limits.1)) {
            return right
        } else {
            return nil
        }
    }
    
    private func countLeafs(_ root: TNode?) -> Int {
        guard root != nil else { return 0 }
        guard TreeUtils.isLeaf(root!) else { return 1 }
        
        return countLeafs(root!.left) + countLeafs(root!.right)
    }

}

