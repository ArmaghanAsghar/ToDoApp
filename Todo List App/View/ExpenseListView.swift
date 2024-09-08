//
//  ContentView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/8/24.
//

import SwiftUI
import SwiftData

struct ExpenseListView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var isShowingItemSheet = false
    @Query(sort: \ExpenseModel.date) var expenses: [ExpenseModel] = []
    @State private var expenseToEdit: ExpenseModel?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseItemView(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(expenses[index])
                    }
                })
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet, content: {
                ExpenseAddSheet()
            })
            .sheet(item: $expenseToEdit) { expense in
                ExpenseUpdateSheet(expense: expense)
            }
            .toolbar(content: {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            })
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list.")
                    }, actions: {
                        Button(action: {
                            isShowingItemSheet = true
                        }) {
                            Text("Add Expense")
                        }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}



#Preview {
    ExpenseListView()
}
