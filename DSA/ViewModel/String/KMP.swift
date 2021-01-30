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
    
    let restarters = setupRestart(pattern)
    
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

///
/// Prepare a restart indexes for each char in pattern
/// - Parameter pattern: input
/// - Returns: dict with restart value (in case of repetitions)
/// - Remark: Example: abcdabeabf will produce output of 0000120120
///           More here https://www.youtube.com/watch?v=V5-7GzOfADQ
///
func setupRestart(_ patt: String) -> [Int] {
    
    let pattern = Array(patt)
    let length  = pattern.count
    var result  = [Int]()
    var first: Character?
    var j = 0
    var i = 0
    
    while i<length {
        if i == 0 {
            first = pattern[i]
            result.append(0)
        } else {
            if pattern[i] == first! {
                result.append(1)
                j = 2
                while pattern[j] == pattern[i] {
                    result.append(j)
                    j += 1
                    i += 1
                }
            } else {
                result.append(0)
                i += 1
            }
        }
    }
    return result
}
