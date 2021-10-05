//
//  JumpGame.swift
//  DSA
//
//  Created by Ethan on 05/10/2021.
//

import Foundation



extension Arr {
    
    /*
     
     You are given an integer array nums. You are initially positioned at the array's first index,
     and each element in the array represents your maximum jump length at that position.

     Return true if you can reach the last index, or false otherwise.

     Example 1:

     Input: nums = [2,3,1,1,4]
     Output: true
     Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

     Example 2:

     Input: nums = [3,2,1,0,4]
     Output: false
     Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0,
     which makes it impossible to reach the last index.
     
     */

    // Complx: O(n) * Sum(Arr)
    func jumpGame(_ arr: [Int], start: Int = 0) -> Bool {
        
        guard start != arr.count - 1 else { return true }
        guard start < arr.count else { return false }
        
        var result = false
        
        JUMPS: for i in start..<arr.count {
            // check all possible jumps for that element count
            let jumps = arr[i]

            for j in 1...jumps {
                // test that jump number
                if start + j < arr.count {
                    if jumpGame(arr, start: start + j) {
                        result = true
                        break JUMPS
                    }
                } else {
                    continue
                }
            }
        }
        return result
    }
     
}
