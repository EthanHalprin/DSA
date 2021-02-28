//
//  Kadane.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

extension Arr {
 
    //
    // Find maximum sub array in an array that can contain negative values
    //
    func kadane(_ arr: [Int]) -> (Int, Int, Int)? {
        
        guard arr.count > 0 else { return nil }
        if arr.count == 1        { return (arr[0], 0 ,0) }

        var accumulator = 0
        var max         = Int.min
        var start       = 0
        var end         = 0
        
        for i in 0..<arr.count {
            accumulator += arr[i]
            if accumulator > max {
                max = accumulator
                end = i
            }
            if accumulator < 0 {
                accumulator = 0
                if start < arr.count - 1 {
                    start = i + 1
                }
            }
        }
      
        return (max, start, end)
    }
}
