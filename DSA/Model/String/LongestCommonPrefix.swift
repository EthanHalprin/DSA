//
//  LongestCommonPrefix.swift
//  DSA
//
//  Created by Ethan on 01/04/2021.
//
import Foundation

extension Str {
    
    /*
        Write a function to find the longest common prefix string
        amongst an array of strings.
        (Google)
     
        example:
            
            input = [ "aacdfd",
                      "aacs",
                      "aa",
                      "awlifkjdshkuhdehrtwehrtwk" ]
     
            output = "aac"
        
        Solution:
     
          Imagine all strings in matrix structure. We need to go
          over each column and verify all equal in it. If it is,
          add the checked char to the prefix result. If not, or
          if we reached end of string - wrap it up.
         V
         a f c b v b
         a f c b v x
         a f c b v -
         a f c - - -
         a f c b v z
         
         result - "afc"
         
     */
    
    //
    // Naive Solution (Code)
    // –––––––––––––––––––––
    //
    func maxCommonPrefix(_ strings: [String]) -> String? {
        
        guard strings.count > 0 else { return nil }
        
        var common = ""
        var i = 0
        var isCommon = false
        
        out: for str in strings {
                guard i < str.count else { break out }
                isCommon = true
                let topCompared = str[i]
                for s in strings {
                    if s.count == i {
                        break out
                    } else {
                        if topCompared != s[i] {
                            isCommon = false
                            break
                        }
                    }
                }
                if isCommon {
                    common.append(str[i])
                }
                i++
            }
            return common
    }
}

extension StringProtocol {
    // usage: let char = String(input[3])
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension Int {
    static postfix func ++(vector: inout Int) {
        vector += 1
    }
}

