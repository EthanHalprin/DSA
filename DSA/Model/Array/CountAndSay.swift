//
//  4Sum.swift
//  DSA
//
//  Created by Ethan on 24/03/2021.
//

import Foundation

/*
 
 The count-and-say sequence is the sequence of integers beginning as follows:
 1, 11, 21, 1211, 111221, ...
 
 */
func countAndSay(_ numbers: [Int]) -> [Int]? {

    guard numbers.count > 0 else { return nil }

    var repeater = numbers[0]
    var count = 1
    var result = [Int]()
    var i = 0

    while i < numbers.count {  // O(N)
        // count the identical consecutives
        while numbers[i] == repeater {
            count += 1
            i += 1
        }
        // record your count
        result.append(count)
        result.append(repeater)

        // update repeater
        repeater = numbers[i]
        count = 1
        i += 1
    }
    return result
}
