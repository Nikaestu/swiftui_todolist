//
//  TileView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import SwiftUI

struct TileView: View {
    var tileItem: Task
    var deleteAction: () -> Void
    
    var body: some View {
        HStack {
            VStack() {
                Text(tileItem.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
            }
            Spacer()
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(25)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

#Preview {
    TileView(tileItem: Task(id: UUID(), name: "Tâche 1"), deleteAction: { print ("Okey")})
}
