//
//  RottenOranges.swift
//  DSA
//
//  Created by Ethan on 04/03/2021.
//

import Foundation

enum FruitCondition {
    case missing
    case ripe
    case rotten
}

class FruitCell {
    var condition = FruitCondition.ripe
    var row: Int  = 0
    var col: Int  = 0
    var data: Int = 0
    
    func propagate(_ matrix: inout [[FruitCell]], size: Int) -> [FruitCell] {
        
        var rottened = [FruitCell]()
        
        if row > 0 && matrix[row - 1][col].condition == .ripe {
            matrix[row - 1][col].condition = .rotten
            rottened.append(matrix[row - 1][col])
        }
        if col < size - 1  && matrix[row][col + 1].condition == .ripe {
            matrix[row][col + 1].condition = .rotten
            rottened.append(matrix[row][col + 1])
        }
        if row < size - 1 && matrix[row + 1][col].condition == .ripe {
            matrix[row + 1][col].condition = .rotten
            rottened.append(matrix[row + 1][col])
        }
        if col > 0 && matrix[row][col - 1].condition == .ripe {
            matrix[row][col - 1].condition = .rotten
            rottened.append(matrix[row][col - 1])
        }
        
        return rottened
    }
}

class Queue {
    
    private var items = [FruitCell]()
    
    func enqueue(_ element: FruitCell) {
        items.append(element)
    }
    
    func dequeue() -> FruitCell {
        
        guard items.count > 0 else { fatalError("Empty stack") }
        guard let first = items.first else { fatalError("Cannot dequeue") }
        
        let pulled = FruitCell()
        pulled.condition = first.condition
        pulled.row = first.row
        pulled.col = first.col
        pulled.data = first.data
        
        items.removeFirst()
        
        return pulled
    }
    
    func isEmpty() -> Bool { return items.count == 0 }
    
}

func rottenTime(_ matrix: inout [[FruitCell]]) -> Int {
    
    let size = matrix.count
    var firstRotten: FruitCell?
        
    for i in 0..<size {
        guard firstRotten == nil else { break }
        for j in 0..<size {
            if matrix[i][j].condition == .rotten {
                firstRotten = matrix[i][j]
                break
            }
        }
    }
    
    guard let firstRot = firstRotten else { return 0 }
    
    let queue = Queue()
    queue.enqueue(firstRot)
    var propogationCount = 0
    
    while !queue.isEmpty() {
        
        let fruitCell = queue.dequeue()
        
        if fruitCell.condition == .rotten {
            let newRottened = fruitCell.propagate(&matrix, size: matrix.count)
            newRottened.forEach { fruit in queue.enqueue(fruit) }
            propogationCount += 1
        }
    }
    
    return propogationCount
}

