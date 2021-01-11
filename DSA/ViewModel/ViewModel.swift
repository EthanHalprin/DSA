//
//  ViewModel.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import Foundation

/// Enacapuslated and Singeltoned Facade for DSA varieties
class ViewModel {

    class Arr {
        static var shared = Arr()
        private init() {}
    }
    
    class Graph {
        static var shared = Graph()
        private init() {}
    }
}
