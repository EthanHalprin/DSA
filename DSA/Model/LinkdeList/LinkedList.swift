//
//  LinkedList.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

class LinkedList {
    static var shared = LinkedList()
    private init() {}
}

class LLNode {
    var data: Int = 0
    var next: LLNode?
}
