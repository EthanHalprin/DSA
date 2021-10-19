//
//  MinPathSum.swift
//  DSA
//
//  Created by Ethan on 19/10/2021.
//

import Foundation

extension Arr {
    
    /*
     Given a m x n grid filled with non-negative numbers, find a path
     from top left to bottom right, which minimizes the sum of all numbers
     along its path.

     Note: You can only move either down or right at any point in time.
     
     Example 1:
     
     1  3  1
     1  5  1
     4  2  1

     Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
     Output: 7
     Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
     */
    
    func minimumPathSum(_ mat: [[Int]], start: (Int ,Int)) -> Int {
        
        // Greedy: choose the minimal option on every turn
        
        // Stop Condition: reached Bottom-Right
        guard start.0 < mat.first!.count - 1 && start.1 < mat.first!.count - 1 else {
            return mat[start.0][start.1]
        }

        // Take positions for down & bottom
        let down = (start.0 + 1, start.1)
        let bottom = (start.0 , start.1 + 1)
        
        // Get minimum form each outlet, including curr value
        let downRouteSum = mat[down.0][down.1] + minimumPathSum(mat, start: down)
        let bottomRouteSum = mat[bottom.0][bottom.1] + minimumPathSum(mat, start: bottom)
        
        // Return the minimum of minumums
        return downRouteSum < bottomRouteSum ? downRouteSum : bottomRouteSum
    }
    
}
