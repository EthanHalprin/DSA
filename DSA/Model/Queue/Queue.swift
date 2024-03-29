//
//  Queue.swift
//  DSA
//
//  Created by Ethan on 06/03/2021.
//

import Foundation


final class QueueServices {
    
    static var shared: QueueServices {
        if let ref = QueueServices.theRef {
            return ref
        } else {
            QueueServices.theRef = QueueServices()
            return QueueServices.theRef!
        }
    }

    static private var theRef: QueueServices?
    private init() {  }
}


class Queue<T: NSCopying> {
    
    private var items = [T]()
    
    func isEmpty() -> Bool { return items.count == 0 }
    
    func enqueue(_ element: T) { items.append(element) }
    
    func dequeue() -> T {
        
        guard items.count > 0 else { fatalError("Empty stack") }
        guard let first = items.first else { fatalError("Cannot dequeue") }
        
        let copy = first.copy() as! T
        items.removeFirst()
        
        return copy
    }
}
