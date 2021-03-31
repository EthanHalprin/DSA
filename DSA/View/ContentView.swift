//
//  ContentView.swift
//  DSA
//
//  Created by Ethan on 03/01/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            List() {
                StringSection()
                QueueSection()
                ArraySection()
                LinkedListSection()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("DSA")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StringSection: View {
    var body: some View {
        Section(header: Text("STRING")) {
            Text("RabinKarp")
            Text("Sentence Reverse")
            Text("String Permutations (DP)")
        }
    }
}

struct QueueSection: View {
    var body: some View {
        Section(header: Text("QUEUE")) {
            Text("Rotten Oranges")
        }
    }
}

struct ArraySection: View {
    var body: some View {
        Section(header: Text("ARRAY")) {
            Text("Circular Tour")
            Text("Kadane")
            Text("Stock Span")
            Text("Count And Say")
        }
    }
}

struct LinkedListSection: View {
    var body: some View {
        Section(header: Text("Linked List"),
                footer: Text("Open Xcode for code and tests").frame(maxWidth: .infinity, alignment: .center)) {
            Text("Reverse")
        }
    }
}
