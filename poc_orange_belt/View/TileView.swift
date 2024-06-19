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
    
    var textColor: Color {
        return isOn ? .gray : .black
    }
    
    var body: some View {
        HStack {
            Toggle("", isOn: $isOn)
            .toggleStyle(iOSCheckboxToggleStyle())
            Text(tileItem.name)
                .foregroundColor(textColor)
                .font(.title2)
                .italic(isOn)
                .strikethrough(isOn)
            Spacer()
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(25)
        .border(textColor)
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
                    .foregroundStyle(configuration.isOn ? Color(.gray) : Color(.black))
                configuration.label
            }
        })
    }
}


#Preview {
    TileView(tileItem: Task(id: UUID(), name: "Tâche 1"), deleteAction: { print ("Okey")}, isOn: false)
}
