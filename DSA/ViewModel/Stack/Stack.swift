//
//  Stack.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

class Stack<T> {
    
    private var data = [T]()
    
    func push(_ item: T) {
        data.append(item)
    }
    
    func pop() -> T? {
        guard !data.isEmpty else { return nil }
        
        if let item = data.removeLast(1) as? T {
            return item
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        guard !data.isEmpty else { return nil }
        return data[data.count - 1]
    }
    
    func isEmpty() -> Bool { return data.isEmpty }
}

