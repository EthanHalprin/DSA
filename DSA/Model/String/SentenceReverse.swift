//
//  SentenceReverse.swift
//  DSA
//
//  Created by Ethan on 10/03/2021.
//

import Foundation

/*
    Let a string be a sentence, reverse all words e.g.
 
      input:  "I learn swift now"
      output: "now swift learn I"
 */
extension Str {
    
    func reverseSentence(_ text: [Character]) -> [Character] {
        
        guard !isSingleWorded(text) else {
            return text
        }
        
        let first = extractHead(text)
        let rev   = first + text
        
        return rev
    }
    
    func isSingleWorded(_ text: [Character]) -> Bool {
        
        var result = true
        
        for ch in text {
            if ch == " " {
                result = false
                break
            }
        }
        return result
    }
    
    func extractHead(_ text: [Character]) -> [Character] {
        
        var i = 0
        var result = [Character]()
        
        while text[i] != " " {
            result.append(text[i])
            i += 1
        }
        return result
    }
}
