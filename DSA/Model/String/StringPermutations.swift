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
        
        // 2- Dymanic Programming: Tabulation
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
    
    func permuteIntArr(_ arr: [Int], starter: Int, results: inout [[Int]]) {
        
        /*
             [1, 2, 3, 4]
             
         1
            234
            324
            423
            432
         
             1- keep first a[i]
             2- recurse: a[i+1...]
             3- take results & add your a[i] for each location
             4- add to general results
         */
        
        guard starter < arr.count - 1 else {
            var item = [Int]()
            item.append(arr.last!)
            results.append(item)
            return
        }
        
        let keepFirst = arr[starter]
        
        permuteIntArr(arr, starter: starter + 1, results: &results)
        
        var keeperResults = [[Int]]()
        for i in 0..<results.count {
            for j in 0..<results[i].count {
                let perms = appendAllOver(results[j], inject: keepFirst)
                for perm in perms {
                    keeperResults.append(perm)
                }
            }
        }
        
        for res in keeperResults {
            results.append(res)
        }
    }
    
    func appendAllOver(_ arr:[Int], inject: Int) -> [[Int]] {
        
        var results = [[Int]]()
        
        for position in 0..<arr.count {
            var permutation = [Int]()
            let left = position
            let right = arr.count - position
            for j in 0..<left {
                permutation.append(arr[j])
            }
            permutation.append(inject)
            var k = left + 1
            while k<right {
                permutation.append(arr[k])
                k += 1
            }
            results.append(permutation)
        }
        
        return results
    }
}
