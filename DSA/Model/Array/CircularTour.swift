//
//  Kadane.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

enum CircularTourError: Error {
    case arrEmpty
    case arrSingleCity
}

extension Arr {
 
    /*
       1st = petrol
       2nd = distance
     
       Input = [ (4,6) , (6,5) , (7,3) , (4,5) ]
     
       Output = 1 (index of (6,5)
     
       O(N) Solution
       —————————————
       Keep in hash what already calculated, this way
       re-checking, when coming from a different start point, we
       save all the passing.
       We can account for the slice to work in aspect of balance
       issues, since if we checked from base petrol capacity for
       the cell, all the more so, if we add a non-negative balance
       preliminary.
       Need to traverse array 2N times (consider last cell route)
       which is practically O(N)
    */
    func circularTourist(_ arr: [(Int, Int)]) -> Result<Int, Error> {
        
        guard arr.count > 0 else {
            return Result.failure(CircularTourError.arrEmpty)
        }

        guard arr.count != 1 else {
            return Result.failure(CircularTourError.arrSingleCity)
        }
        
        var balance = 0
        var i       = 0
        var stepper = 0
        var tour    = 0
        var start   = -1
        
        var routeSlices = [Int: Int]() // e.g
        
        while tour < arr.count && stepper < 2 * arr.count + 1 {
            if let sliceEnd = routeSlices[i] {
                i = sliceEnd + 1
            }
            if arr[i].0 + balance >= arr[i].1 {
                if start == -1 {
                    start = i
                }
                balance += arr[i].0 - arr[i].1
                tour += 1
            } else {
                // keep
                if start != -1 {
                    routeSlices[start] = i
                }
                // reset
                start = -1
                balance = 0
                tour = 0
            }
            i = (i + 1) % arr.count
            stepper += 1
        }
        let res: Int = tour == arr.count ? start : -1
        
        return Result.success(res)
    }
}
