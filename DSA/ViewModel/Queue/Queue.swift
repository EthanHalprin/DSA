//
//  Stack.swift
//  DSA
//
//  Created by Ethan on 18/01/2021.
//

import Foundation

class Queue {
    static var shared = Queue()
    private init() {}
}

extension Queue {
    
    private class QueueImp<T> {
        
        private var data = [T]()
        
        func enqueue(_ item: T) {
            data.append(item)
        }
        
        func dequeue() -> T? {
            guard !data.isEmpty else { return nil }
            return data.removeFirst()
        }
    }
}

