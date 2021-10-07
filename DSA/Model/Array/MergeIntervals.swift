//
//  MergeIntervals.swift
//  DSA
//
//  Created by Ethan on 07/10/2021.
//

import Foundation


extension Arr {
    
    /*
                        i0 i1  i0<=j0<=i1
            V
     Input: intervals = [[2,5],  [1,7],  [5,18], [20,25], [24,30] ]
        results = [[1,7],
     Output: [[1,6],[8,10],[15,18]]
     
     Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
     */
    
    func mergeIntervals(_ intervals: [(Int, Int)]) -> [(Int, Int)] {
        
        var results = [(Int, Int)]()
        
        
        for i in 0..<intervals.count {
            // check vs the results
            if let lastResult = results.last {
                if let tuple = mergeTuplesIntervals(lastResult, tuple2: intervals[i+1]) {
                    results.append(tuple)
                }
            }
            if i < intervals.count - 1 {
                // check vs. the next
                if let tuple = mergeTuplesIntervals(intervals[i], tuple2: intervals[i+1]) {
                    results.append(tuple)
                }
            }
        }
        
        return results
    }
    
    func mergeTuplesIntervals(_ tuple1: (Int, Int), tuple2: (Int, Int)) -> (Int, Int)? {
        
        var result: (Int, Int)?
        
        if tuple1.0 <= tuple2.0 && tuple2.0 <= tuple1.1 {
            result = (tuple1.0, tuple2.1)
        } else if tuple1.0 <= tuple2.0 &&  tuple1.1 >= tuple2.1 {
            // nested case
            result = tuple2
        }
        
        return result
    }
}
