//
//  ExpenseModel.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/8/24.
//

import Foundation
import SwiftData

@Model
class ExpenseModel {
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, data: Date, value: Double) {
        self.name = name
        self.date = data
        self.value = value
    }
}
