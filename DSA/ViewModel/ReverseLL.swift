//
//  Kadane.swift
//  DSA
//
//  Created by Ethan on 12/01/2021.
//

import Foundation

class LLNode {
    var data: Int = 0
    var next: LLNode?
}

extension ViewModel.LinkedList {
 
    //
    // Reverse list - head insertion each time
    //
    func reverse(_ head: LLNode?) -> LLNode? {
        
        guard let head = head  else { return nil  }
        guard head.next != nil else { return head }
        
        var rev: LLNode?  = nil
        var curr: LLNode? = nil
        var next: LLNode? = head
        
        while next != nil {
            curr = rev
            rev = next
            next = next!.next
            rev!.next = curr
        }
        
        return rev
    }
}
