//
//  MedianSortedArrays.swift
//  DSA
//
//  Created by Ethan on 24/07/2021.
//

import Foundation



extension Arr {
    
    /*
     
     Median of Two Sorted Arrays
     
     Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
     The overall run time complexity should be O(log (m+n)).
     
     
     Example 1:

     Input: nums1 = [1,3], nums2 = [2]
     Output: 2.00000
     Explanation: merged array = [1,2,3] and median is 2.
     Example 2:

     Input: nums1 = [1,2], nums2 = [3,4]
     Output: 2.50000
     Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
     Example 3:

     Input: nums1 = [0,0], nums2 = [0,0]
     Output: 0.00000
     Example 4:

     Input: nums1 = [], nums2 = [1]
     Output: 1.00000
     Example 5:

     Input: nums1 = [2], nums2 = []
     Output: 2.00000     */
    
    
    func medianOf2(_ arr1: [Int], arr2: [Int]) -> Float {
        
        var i = 0
        var j = arr2.count - 1
        var isArr2Only = false
        var isArr1Only = false
        var isEqualPoint = false

        while i < j && !isEqualPoint {
            //      i                 j
            // [1,2,3], nums2 [60,70,80,90,100,120,300]
            //
            if isArr1Only {
                if i < arr1.count - 1 && j > 0 {
                    i += 1
                    j -= 1
                }
            } else if isArr2Only {
                if i < arr2.count - 1 && j > 0 {
                    i += 1
                    j -= 1
                }
            } else {
                if i < arr1.count - 1 && j > 0
                {
                    i += 1
                    j -= 1
                }
                else if i == arr1.count - 1 && j > 0
                {
                    i = 0
                    j -= 1
                    isArr2Only = true
                }
                else if i < arr1.count - 1 && j == 0
                {
                    i += 1
                    j = arr1.count - 1
                    isArr1Only = true
                }
                else {
                    // equality in sizes: i == arr1.count - 1 && j == 0
                    isEqualPoint = true
                }
            }
        }
        
        guard !isEqualPoint else {
            return Float(arr1[i] + arr2[j]) / 2.0
        }

        if isArr1Only {
            if j == i {
                // Odd case
                return Float(arr1[i])
            } else { // i < j
                // Even case
                return Float(arr1[i] + arr1[j]) / 2.0
            }
        } else {
            if isArr2Only {
                if j == i {
                    // Odd case
                    return Float(arr2[i])
                } else { // i < j
                    // Even case
                    return Float(arr2[i] + arr2[j]) / 2.0
                }
            } else {
                fatalError("impossible")
            }
        }
    }
}
