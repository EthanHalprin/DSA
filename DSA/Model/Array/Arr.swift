//
//  Arr.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

class Arr {
    
    static var shared: Arr {
        if let ref = Arr.theRef {
            return ref
        } else {
            Arr.theRef = Arr()
            return Arr.theRef!
        }
    }
    
    static private var theRef: Arr?
    private init() {  }
}
