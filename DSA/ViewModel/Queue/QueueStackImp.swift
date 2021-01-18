//
//  QueueStackImp.swift
//  DSA
//
//  Created by Ethan on 18/01/2021.
//

import Foundation


class QueueStackImp {
    
    private var aux = Stack<Any>()
    private var ordered = Stack<Any>()

    func enqueue(_ item: Any) {
        if ordered.isEmpty() {
            aux.push(item)
        } else {
            while !ordered.isEmpty() {
                aux.push(ordered.pop()!)
            }
            aux.push(item)
        }
    }
    
    func deque() -> Any? {
        var item: Any?
        
        if aux.isEmpty() {
            if ordered.isEmpty() {
                item = nil
            } else {
                item = ordered.pop()
            }
        } else {
            while !aux.isEmpty() {
                ordered.push(aux.pop()!)
            }
            item = ordered.pop()
        }

        return item
    }
    
}
