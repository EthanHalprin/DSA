//
//  Kadane.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

extension Arr {
 
    /*
       1st = petrol
       2nd = distance
     
       Input = [ (4,6) , (6,5) , (7,3) , (4,5) ]
     
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
    func circularTourist(_ arr: [(Int, Int)]) -> Int {
        
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
                routeSlices[start] = i
                // reset
                i = start
                start = -1
                balance = 0
                tour = 0
            }
            i = (i + 1) % arr.count
            stepper += 1
        }
        let result: Int = tour == arr.count ? start : -1
        
        return result
    }
}
