//
//  SubPalindromes.swift
//  DSA
//
//  Created by Ethan on 01/07/2021.
//

import Foundation



extension Str {
    
    /*
        The common way is recursion (with dropping left and right each time to
        cover all cases). This is always O(N^2).
     
        But I chose using a hash to keep up with the characters positions. Key
        is the char and value is vector of the positions. Algorithm is to go over
        each char in string and to look it up in the hash. If it's there, there
        could be a palindrome from the current index to each of the positions,
        therefore I check all of the out.
        The complexity here depends on the diversity of the input. A mostly-identical-chars
        array would probably yield a O(N^2) complexity, but more efficiency can be gained
        if string is diversed (e.g. best case is O(N) if al chars are different)
     
     */
    func checkSubPalindromes(_ str: String) -> [(Int, Int)] {

        guard str.count>0 else {
            return [(Int, Int)]()
        }
        
        // holds last character appearance index
        var hash    = [Character: [Int]]()
        var results = [(Int, Int)]()
        var left    = 0
        var right   = 0
        
        for (i, ch) in str.enumerated() {
            if let indexes = hash[ch] {
                for index in indexes {
                    left = index
                    right = i
                    // palindrome check in the defined slice
                    while left < right && str[left] == str[right] {
                        left  += 1
                        right -= 1
                    }
                    // results check
                    if left == right {
                        results.append((index, i))
                    }
                }
                hash[ch]!.append(i)
            } else {
                var indexs = [Int]()
                indexs.append(i)
                hash[ch] = indexs
            }
        }
        
        return results
    }
}
