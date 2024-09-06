//
//  ItemModel.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import Foundation

struct ItemModel: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String =  UUID().uuidString,  
         title: String,
         isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // Important note, we only complete the items in the model
    // not outside the model.
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
