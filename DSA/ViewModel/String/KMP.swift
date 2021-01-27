//
//  KMP.swift
//  DSA
//
//  Created by Ethan on 24/01/2021.
//

import Foundation

/*
    pattern = [ABAB]
    lookup  = [CVSFDFABABSDFSDABABAB]
                     ^        ^ ^
    result  = [6, 15, 17]
 
    Complexity: O(n)
 */
func kmp(_ lookup: String, pattern: String) -> [Int] {
    
    var starters = [String]()
    
    for _ in 0..<pattern.count {
        starters.append("")
    }
    
    var i = -1
    var j = -1
    var results = [Int]()
    
    while i<lookup.count {
        while j < pattern.count {
            i += 1
            j += 1
            if j == pattern.count {
                results.append(i - pattern.count)
            } else {
                if Array(lookup)[i] != Array(pattern)[j] {
                    j = pattern.count
                }
            }
        }
        i += 1
        j = 0
    }
    
    return results
}
