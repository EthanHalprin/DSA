//
//  StringPermutations.swift
//  DSA
//
//  Created by Ethan on 17/03/2021.
//

import Foundation


extension Str {
    
    /*
        input = "abc"  -> [abc, acb, bca, bac, cab, cba]
     */
    func permutationsProvider(_ input: String) -> [String] {
        
        // 1- Approach - recursion
        guard input.count > 1 else {
            return [input]
        }
        
        var results = [String]()

        guard input.count > 2 else {
            results.append(input)
            results.append(String(input[input.endIndex]) + String(input[input.startIndex]))
            return results
        }
        
        var permutations = permutationsProvider(String(input.dropFirst(1)))
        
        for (i, perm) in permutations.enumerated() {
            
            let index1 = perm.index(perm.startIndex, offsetBy: i - 1)
            let prefix = perm.prefix(upTo: index1)
            
            let iChar = Array(perm)[i]

            let index2 = perm.index(perm.endIndex, offsetBy: input.count - i - 1)
            let suffix = perm.suffix(from: index2)
            
            permutations.append(String(prefix) + String(iChar) + suffix)
        }
        
        // 2- Dymanic Programmin: Tabulation
        var count = input.count
        
        while count > 0 {
            for i in 0..<count {
                var permutation = Array(arrayLiteral: input)
                permutation.swapAt(0, i)
                results.append(contentsOf: permutation)
            }
            count -= 1
        }
        return permutations
    }
}
