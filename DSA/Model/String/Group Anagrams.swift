//
//  Group Anagrams.swift
//  Group Anagrams
//
//  Created by Ethan on 17/09/2021.
//

import Foundation


extension Str {
    
    /*
     Given an array of strings strs, group the anagrams together. You can return the answer in
     any order. An Anagram is a word or phrase formed by rearranging the letters of a different
     word or phrase, typically using all the original letters exactly once.

     Example:

     Input: strs = ["eat","tea","tan","ate","nat","bat"]
     Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
     */
    
    func groupAnagrams(_ input: [String]) -> [[String]] {
        
        var hashGroups = [Int: [String]]()
        
        for s in input {
            let hash = Int (s.asciiValues.reduce(0, +))  // [97, 98, 99] -> + (add 'em up)
            if var group = hashGroups[hash] {
                group.append(s)
            } else {
                var newGroup = [String]()
                newGroup.append(s)
                hashGroups[hash] = newGroup
            }
        }
        
        var results = [[String]]()
        
        for hashGroup in hashGroups {
            results.append(hashGroup.value)
        }

        return results
    }
    
}

extension StringProtocol {
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}
