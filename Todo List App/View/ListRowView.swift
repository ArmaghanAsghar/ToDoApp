//
//  ListRowView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            if item.isCompleted {
                Image(systemName: "checkmark.circle")
                    .foregroundStyle(Color.green)
            } else {
                Image(systemName: "circle")
                    .foregroundStyle(Color.red)
            }
             
            Text("\(item.title)")
            Spacer()
        }
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "", isCompleted: false))
}
