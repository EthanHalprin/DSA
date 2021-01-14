//
//  StockSpan.swift
//  DSA
//
//  Created by Ethan on 14/01/2021.
//

import Foundation

extension Arr {
    //
    // https://www.geeksforgeeks.org/the-stock-span-problem/
    //
    // The stock span problem is a financial problem where we have
    // a series of n daily price quotes for a stock and we need to
    // calculate span of stock’s price for all n days.
    //
    // The span Si of the stock’s price on a given day i is defined
    // as the maximum number of consecutive days just before the given
    // day, for which the price of the stock on the current day is
    // less than or equal to its price on the given day.
    //
    // For example, if an array of 7 days prices is given as:
    // {100, 80, 60, 70, 60, 75, 85},
    // then the span values for corresponding 7 days are:
    // {1, 1, 1, 2, 1, 4, 6}
    //
    func stockSpan(_ prices: [Int]) -> [Int]? {
        
        guard prices.count > 0 else { return nil }
        guard prices.count > 1 else { return [1]     }
        
        var spans = Array.init(repeating: 0, count: prices.count)
        spans[0] = 1
        
        for i in 1..<prices.count {
            spans[i] = 1
            if prices[i] >= prices[i - 1] {
                var j = i - 1
                
                // "Exploit" the prevoius spans already computed
                // to calculate current (i) span and also to
                // advance back rapidly for more possible span
                while j > 0 {
                    if prices[i] >= prices[j] {
                        spans[i] += spans[j - 1]
                        j -= spans[j - 1]
                    } else {
                        j = 0
                    }
                }
            }
        }
        
        return spans
    }

}
