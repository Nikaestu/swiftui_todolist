//
//  ContentView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Ma To-Do List")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
        CreationTaskView()
        ListView()
    }
}

#Preview {
    ContentView()
}
