//
//  ExpenseUpdateSheet.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/8/24.
//

import SwiftUI
import SwiftData

struct ExpenseUpdateSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense: ExpenseModel
    
    var body: some View {
    
       NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
               
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            })
        }
    }
}
