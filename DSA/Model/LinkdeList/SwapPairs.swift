//
//  SwapPairs.swift
//  DSA
//
//  Created by Ethan on 10/08/2021.
//

import Foundation


extension LinkedList {
    
    /*
        Swap pairs but without changing data values
     
                     v1   v2  np
        input  = head -> 1 -> 2-> 3-> 4-> nil
     
        output = head -> 2 -> 1-> 3-> 3-> nil
     */
    
    
    func swapPairs(_ head: inout LLNode?) {
        
        guard var head = head else {
            return
        }
        
        guard head.next != nil else {
            return
        }
        
        var nextPair = head.next?.next
        var v1: LLNode? = head
        var v2 = head.next
        var isFirst = true
        
        while nextPair != nil && v2 != nil {
            v2?.next = v1
            v1?.next = nextPair
            
            if !isFirst {
                head = v2!
                isFirst = true
            }
            
            v1 = nextPair
            v2 = nextPair?.next
            
            nextPair = nextPair?.next?.next
        }
    }
}
