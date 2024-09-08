//
//  AddExpenseSheet.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/8/24.
//

import SwiftUI
import SwiftData

struct ExpenseAddSheet: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = ExpenseModel(name: name, data: date, value: value)
                        modelContext.insert(expense) // will autosave in swiftui
                        dismiss()
                    }
                }
            })
        }
    }
}

#Preview {
    ExpenseAddSheet()
        .modelContainer(for: ExpenseModel.self)
}
