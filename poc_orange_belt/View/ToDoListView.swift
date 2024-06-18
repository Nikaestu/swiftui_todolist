//
//  ToDoListView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 17/06/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var tasks: [Task] = []
    @State var task: Task?

    var body: some View {
        TitleView()
        CreationTaskView(task: $task, onSaveTask: { newTask in
            if let newTask = newTask {
                tasks.append(newTask)
                task = nil
            }
        })
        ListView(tasks: $tasks)
        Spacer()
    }
}

#Preview {
    ToDoListView()
}
