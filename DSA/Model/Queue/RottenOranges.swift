//
//  RottenOranges.swift
//  DSA
//
//  Created by Ethan on 04/03/2021.
//

import Foundation

extension QueueServices {
    
    /*
     Matrix needs to be equal number of rows and cols (just for convieniace)
     */
    func rottenTime(_ matrix: inout [[FruitCell]]) -> Int {

        guard matrix.count > 0 else { return 0 }
        
        let size = matrix[0].count
        let queue = Queue<FruitCell>()
        var count = 0

        for i in 0..<size {
            for j in 0..<size {
                if matrix[i][j].condition == .rotten {
                    queue.enqueue(matrix[i][j])
                    count += 1
                }
            }
        }
        
        guard count > 0 && count < size * size else { return 0 }
        var pace = 0
        var propagated = [FruitCell]()
        var propagatedCount = 0
        
        while !queue.isEmpty() {
            for _ in 0..<count {
                propagated = queue.dequeue().propagate(&matrix, size: size)
                propagatedCount += propagated.count
                for prop in propagated {
                    queue.enqueue(prop)
                }
            }
            if propagatedCount > 0 {
                pace += 1
                count = propagatedCount
                propagatedCount = 0
                propagated.removeAll()
            }
        }
        return pace
    }
}
