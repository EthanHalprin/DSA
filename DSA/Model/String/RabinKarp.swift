//
//  RabinKarp.swift
//  DSA
//
//  Created by Ethan on 08/03/2021.
//

import Foundation


extension Str {
    
    /*
     Given a text txt[0..n-1] and a pattern pat[0..m-1], write a function search(char pat[], char txt[]) that
     prints all occurrences of pat[] in txt[]. You may assume that n > m.
     
     Input:  txt[] =  "AABAACAADAABAABA"
             pat[] =  "AABA"
     Output: Pattern found at index 0
             Pattern found at index 9
             Pattern found at index 12
     
     https://www.geeksforgeeks.org/rabin-karp-algorithm-for-pattern-searching/
     */
    func rabinKarpRollingHash(_ text: String, pattern: String) -> [Int] {
        /*
         naive: O(m*n) - look for every index from scratch
         eff: O(n) - move by index only -> keep tabs on what we've comapared
         */
        
        // key   - the index of strat in text
        // value - current comparing index in pattern
        var tabs = [Int: Int]()
        let prefix = pattern.first
        var results = [Int]()

        for i in 0..<text.count {
            
            let lookup = text[text.index(text.startIndex, offsetBy: i)]
            
            if lookup == prefix {
                // open a new tab comparison
                tabs[i] = 0
            }
            
            for (_, element) in tabs.enumerated() {
                // check for next match
                let next = element.value + 1
                if lookup == pattern[pattern.index(pattern.startIndex, offsetBy: next)] {
                    tabs[element.key] = next
                    if next == pattern.count - 1 {
                        results.append(i)
                        tabs[element.key] = nil
                    }
                }
            }
        }

        return results
    }
    
}
