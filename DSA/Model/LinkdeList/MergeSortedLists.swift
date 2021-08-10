//
//  MergeSortedLists.swift
//  DSA
//
//  Created by Ethan on 10/08/2021.
//

import Foundation

extension LinkedList {
    
    /*
    Merge N Sorted linked lists with total of K elements to one list.
     
     Solution #1
     -----------
     With N indexes.
     O(K*N)  Mem : O(1) - No extra memory.
     
     [
             v1
       1->4->5->70->90,
     
             v2
       1->3->4->80->100,
     
             v3
       2->6->20->300
     ]
     
     1) Take min from all v1,v2,....vn
     2) On the min-owner-linked-list, proceed with "next" pointer to next item
     3) Repeat 1 again
     * If any list goes to nil don't use

     Solution #2
     -----------
     Throw all elements to a min heap and then extract its elements into a list
     in a preOrder.
     K*LogN  Mem: O(K)
     
     1) Go over on all elements and dump into Min Heap
     2) Print PreOrder
          1 2 3 4 5 6 7
       
            1
         2     5
       3  4   6  7
     
     Solution #3
     -----------
     Use a "maximal" bucket to dump all elements data as indexes and then
     enumerate bucket into a new list
     O(K)  Mem: O(MAX)
     
     1) Go over all lists and get max
     2) Allocate array in max size initiated to zeros
     3) Go over all lists and for each elements put data in bucket array (index is data)
     4) Go over bucket and foreach element>0 do a tail insertion to new soreted list
     
     0 1         8
     0|0|0|0|0|0|5|0|0|0|0|0|0|0|0|0|0|0|
     
     merging them into one sorted list:
     1->1->2->3->4->4->5->6
     */
    
    
    /* Solution #1 */
    func mergeSortedLists(_ lists: inout [LLNode]) -> LLNode? {
        
        guard lists.count > 0 else { return nil }
        
        var pointers = [LLNode?]()
        lists.forEach({ pointers.append($0) })

        var joined: LLNode? = nil
        var min = findMin(from: pointers)

        while min.1 != nil {
            
            // only first node
            if joined == nil {
                joined = LLNode()
                joined!.data = min.1!.data
                joined!.next = nil
            } else {
                // tail insertion
                joined!.next = LLNode()
                joined!.next!.data = min.1!.data
                joined!.next = nil
            }
            
            // advance the min list
            let minIndex = min.0
            pointers[minIndex] = pointers[minIndex]!.next
            
            // next min from ALL lists
            min = findMin(from: pointers)
        }
        
        return joined
    }
    
    fileprivate func findMin(from lists: [LLNode?]) -> (Int, LLNode?) {
        
        var min = Int.max
        var minIndex: Int = 0
        var minPointer: LLNode?
        var i = 0
        
        lists.forEach({ list in
            if let ls = list {
                if ls.data < min {
                    min = ls.data
                    minPointer = ls
                    minIndex = i
                }
            }
            i++
        })
        
        return (minIndex, minPointer)
    }
    
}
