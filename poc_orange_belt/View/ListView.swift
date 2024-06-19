//
//  ListView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import SwiftUI

struct ListView: View {
    @Binding var tasks: [Task]

    var body: some View {
        VStack {
            ForEach(tasks) { task in
                TileView(tileItem: task, deleteAction: {    
                    deleteTask(task)
                }, isOn: false)
            }
        }
    }
    
    private func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}

#Preview {
    ListView(tasks: .constant([Task(id: UUID(), name: "Test1")]))
}
