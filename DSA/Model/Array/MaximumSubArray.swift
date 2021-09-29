//
//  MaximumSubArray.swift
//  DSA
//
//  Created by Ethan on 29/09/2021.
//

import Foundation


extension Arr {
    
    /*
     Example:

     Input: nums = [-2, 1, -3, 4, -1, 2, 1, -2, 400, -1, 3]
     Output: 6
     Explanation: [4, -1, 2, 1, -2, 4] has the largest sum = 7.
      */
    
    func maxSubArray(_ arr: [Int]) -> (Int, (Int, Int))? {

        guard arr.count >  0 else { return  nil }
        guard arr.count != 1 else { return  (arr.first!, (0, 0)) }
        
        // special case all negative
        if !arr.contains(where: { $0 > 0 }) {
            var max = Int.min
            var index = -1
            
            arr.enumerated().forEach {
                if $0.element > max {
                    max = $0.element
                    index = $0.offset
                }
            }
            
            return (max, (index, index))
        }
        
        arr.enumerated().forEach { num in
            
        }

        var i1 = 0
        var i2 = 1
        var accumulator = arr[0]
        var max = arr[0]
        var left = 0
        var right = 0
        
        while i1 < i2 && i2 < arr.count {
            if arr[i2] + accumulator > max {
                if arr[i2] > arr[i2] + accumulator {
                    left = arr[i2]
                    right = arr[i2]
                    max = arr[i2]
                    accumulator = arr[i2]
                    i1 = i2
                    i2 += 1
                } else {
                    left = i1
                    right = i2
                    accumulator += arr[i2]
                    max = accumulator
                    i2 += 1
                }
            } else {
                accumulator += arr[i2]
                i2 += 1
            }
        }

        return (max, (left, right))
    }
}
