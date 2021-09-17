//
//  MatrixRotate.swift
//  MatrixRotate
//
//  Created by Ethan on 16/09/2021.
//

import Foundation


extension Arr {
    
    /*

     Example:
     
       1  2  3            7 4 1
       4  5  6    ==>>    8 5 2
       7  8  9            9 6 3
     

     Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
     Output: [[7,4,1],[8,5,2],[9,6,3]]
     
     Soltion Description:
     
     We'll cover first the the top, right, bottom, left rows swap
     by using 4 indexes(one for each direction) + 2 integers for
     keeping values when swapping.
     Swap course shall be: matrix[0][0] goes to end of the row (matrix[0][n-1]),
     the latter goes to bottom-right corner of the matrix, asnd the latter here
     goes to the left-bottom corner of the matrix. Finally the left-bottom corner
     goes to the first matrix[0][0] cell.
     All along the way we must keep values (using the 2 intergers - that's O(1) mem)
     so values won't be lost.
     Next phase: we pass next row from above and prev row from bottom. Same goes for
     columns: next columns from left and right. The algorithm is the same swap course
     depicted above.
     To monitor the passing of the rows & columns we need 2 nested loops - one for passing
     rows and columns and second for runnig the swap once the position is set.

     */
    
    func rotate(matrix A: inout [[Int]]) {
        
        let N = A[0].count
        
        var topVal    = 0
        var rightVal  = N - 1
        var bottomVal = N - 1
        var leftVal   = N - 1

        var top    = 0
        var right  = N - 1
        var bottom = N - 1
        var left   = N - 1

        var keep = 0
        var next = 0
        
        var row = 0
        
        while row < N - 1 {
            
            while top < N - 1 {
                
                // keep & replace in clockwise order
                keep = A[row][right]
                A[row][right] = A[row][top]

                next = A[row][bottom]
                A[row][bottom] = keep

                keep = A[row][left]
                A[row][right] = next

                A[row][right] = keep
                
                top    += 1
                right  -= 1
                bottom -= 1
                left   -= 1
            }
            row += 1
            
            topVal    += 1
            rightVal  -= 1
            bottomVal -= 1
            leftVal   -= 1
            
            top = topVal
            right = rightVal
            bottom = bottomVal
            left = leftVal
        }
    }
    
}
