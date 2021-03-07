//
//  File.swift
//  DSA
//
//  Created by Ethan on 06/03/2021.
//

import Foundation

enum FruitCondition {
    case missing
    case ripe
    case rotten
}

class FruitCell {

    var row: Int
    var col: Int
    var condition: FruitCondition

    required init(row: Int, col: Int, condition: FruitCondition) {
        self.row       = row
        self.col       = col
        self.condition = condition
    }
    
    func propagate(_ matrix: inout [[FruitCell]], size: Int) -> [FruitCell] {
        
        guard self.condition == .rotten else { return [FruitCell]() }
        
        var rottened = [FruitCell]()
        
        if row > 0 && matrix[row - 1][col].condition == .ripe {
            matrix[row - 1][col].condition = .rotten
            rottened.append(matrix[row - 1][col])
        }
        if col < size - 1 && matrix[row][col + 1].condition == .ripe {
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

extension FruitCell: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return FruitCell(row: self.row,
                         col: self.col,
                         condition: self.condition)
    }
}
