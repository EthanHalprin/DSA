//
//  IsValidNumber.swift
//  DSA
//
//  Created by Ethan on 03/07/2021.
//

import Foundation


extension Str {
    /*
        Given an input string, determine if it makes a valid number or not. For simplicity, assume that white spaces are not present in the input.
     */
    func isValidNum(_ str: String) -> Bool {
        
        guard str.count > 0 else { return false }
        
        var result = true
        let zero: Character = "0"
        let nine: Character = "9"
        let dot : Character = "."
        var isDotted = false
        
        for ch in str {
            // dot case - check only one
            if ch.asciiValue! == dot.asciiValue! {
                if isDotted {
                    result = false
                    break
                } else {
                    isDotted = true
                }
            } else {
                // verify it's a digit char
                if ch.asciiValue! < zero.asciiValue! || ch.asciiValue! > nine.asciiValue! {
                    result = false
                    break
                }
            }
        }
        
        return result
    }
}
