//
//  CreationTaskView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 14/06/2024.
//

import SwiftUI

struct CreationTaskView: View {
    @State private var taskName: String = ""
    
    var body: some View {
        HStack {
            TextField("Je suis un champs", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: addTask) {
                Text("+")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
    
    private func addTask() {
        let newTask = Task(id: UUID(), name: taskName)
    }
}

#Preview {
    CreationTaskView()
}
