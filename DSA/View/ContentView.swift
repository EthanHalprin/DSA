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
                Section(header: Text("ARRAY")) {
                    Text("Kadane")
                    Text("Stock Span")
                }
                Section(header: Text("Linked List"),
                        footer: Text("Open Xcode and run tests to see results").frame(maxWidth: .infinity, alignment: .center)) {
                    Text("Reverse")
                }
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
