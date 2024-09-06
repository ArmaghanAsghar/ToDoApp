//
//  ListView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import SwiftUI

struct ListView: View {
   
    // We are referencing the environment objecy
    @EnvironmentObject var listViewModel: ListViewModel
   
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onMove(perform: onMove)
            .onDelete(perform: { indexSet in
                listViewModel.items.remove(atOffsets: indexSet)
            })
            
           
        }
        .listStyle(.plain)
        .navigationTitle("Todo List")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddItemView()
                        .environmentObject(listViewModel)
                }
                
             
            }
        }
    }
    
    private func onMove(from: IndexSet, to: Int) {
        listViewModel.items.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
 
    NavigationStack {
        ListView()
            .environmentObject( ListViewModel())
    }
   
}
