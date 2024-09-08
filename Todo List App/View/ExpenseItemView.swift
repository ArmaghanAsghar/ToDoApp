//
//  ExpenseItemView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/8/24.
//

import SwiftUI
import SwiftData

struct ExpenseItemView: View {
    
    let expense: ExpenseModel
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}


#Preview {
    ExpenseItemView(expense: ExpenseModel(name: "", data: .now, value: 0.0))
        .modelContainer(for: ExpenseModel.self)
}
