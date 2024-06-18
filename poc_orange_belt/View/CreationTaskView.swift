//
//  CreationTaskView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 14/06/2024.
//

import SwiftUI

struct CreationTaskView: View {
    @Binding var task: Task?
        var onSaveTask: (Task?) -> Void

        var body: some View {
            Form {
                Section(header: Text("Nouvelle tâche")) {
                    TextField("Entrer le nom de la tâche", text: Binding(
                        get: { self.task?.name ?? "" },
                        set: { self.task = Task(id: UUID(),name: $0) }
                    ))
                }

                Button(action: {
                    // Save the task
                    self.onSaveTask(self.task)
                }) {
                    Text("Sauvegarder")
                }
                .disabled(task?.name.isEmpty ?? true)
            }
            .padding()
        }
}

#Preview {
    CreationTaskView(task: .constant(nil), onSaveTask: {
        task in
        print("Tâche sauvegardée")
    })
}
