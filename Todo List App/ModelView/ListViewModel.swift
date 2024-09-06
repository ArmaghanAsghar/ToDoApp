//
//  File.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import Foundation

/// Responsible for retriving, storing, and defining beviour for the simulation models. 
class ListViewModel : ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    /// Fetches the content from the storage or an API call.
    private func getItems() {

        // Combined guard let statements. 
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func addNewItem(title: String) {
    
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func updateItem(item: ItemModel) {
     
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = items[index].updateCompleted()
        }
        
    }
    
    // Need to save the data as a JSON object.
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
       
    }
    
}
