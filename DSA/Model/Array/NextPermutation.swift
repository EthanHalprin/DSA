//
//  NextPermutation.swift
//  DSA
//
//  Created by Ethan on 18/05/2021.
//

import Foundation


extension Arr {
    
    func nextPermutation(_ arr: inout [Int]) -> [Int] {
        
        var result = cloneArr(arr)
        
        // try to find minimum bigger righteous num
        var i = arr.count - 1
        var didSwap = false
        var finish = false
        
        while !finish {
            if result[i] > result[i - 1] {
                result.swapAt(i, i - 1)
                didSwap = true
                // must sort the rest of the array
                var suffixSlice = result[i...]
                suffixSlice.sort()
                finish = true
            } else {
                i += 1
                if i == result.count {
                    finish = true
                }
            }
        }
        if !didSwap {
            result.sort()
        }
        
        return result
    }
    
    func cloneArr<T>(_ arr: [T]) -> [T] {
        
        var clone = [T]()
        
        arr.forEach {
            clone.append($0)
        }
        
        return clone
    }
}
