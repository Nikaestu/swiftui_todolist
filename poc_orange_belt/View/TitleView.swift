//
//  TitleView.swift
//  poc_orange_belt
//
//  Created by Dylan Le Hir on 17/06/2024.
//

import SwiftUI

struct TitleView: View {
    var titleName: String
    
    var body: some View {
        Text(titleName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
    }
}

#Preview {
    TitleView(titleName: "Titre")
}
