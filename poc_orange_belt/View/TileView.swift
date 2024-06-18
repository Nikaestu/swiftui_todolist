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
    @State var isOn: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            Text(tileItem.name)
                .foregroundColor(isOn ? .gray : .black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .italic(isOn)
                .strikethrough(isOn)
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

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .colorInvert()
                configuration.label
            }
        })
    }
}


#Preview {
    TileView(tileItem: Task(id: UUID(), name: "Tâche 1"), deleteAction: { print ("Okey")}, isOn: false)
}
