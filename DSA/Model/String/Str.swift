//
//  StringServices.swift
//  DSA
//
//  Created by Ethan on 08/03/2021.
//

import Foundation


final class Str {
    
    static var shared: Str {
        if let ref = Str.theRef {
            return ref
        } else {
            Str.theRef = Str()
            return Str.theRef!
        }
    }

    static private var theRef: Str?
    private init() {  }
}
