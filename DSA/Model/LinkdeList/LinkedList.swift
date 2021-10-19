//
//  LinkedList.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

final class LinkedList {
    
    static var shared: LinkedList {
        if let ref = LinkedList.theRef {
            return ref
        } else {
            LinkedList.theRef = LinkedList()
            return LinkedList.theRef!
        }
    }

    static private var theRef: LinkedList?
    private init() {  }
}


class LLNode {
    var data: Int = 0
    var next: LLNode?
}
