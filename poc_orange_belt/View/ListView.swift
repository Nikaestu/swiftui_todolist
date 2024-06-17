//
//  ListView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import SwiftUI

struct ListView: View {
    
    var data: [Task] = [
        Task(id: UUID(), name: "Courir"),
        Task(id: UUID(), name: "Nager")
    ]
    
    var body: some View {
        VStack {
            ForEach(data) { item in
                TileView(tileItem: item)
            }
        }
    }
}

#Preview {
    ListView()
}
