//
//  Todo_List_AppApp.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import SwiftUI
import SwiftData
@main
struct Todo_List_AppApp: App {
    
    // Need this to be state obejct
    // otherwise we would not be able to reference it. 
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ExpenseListView()
        }
        .modelContainer(for: ExpenseModel.self)
        
        /* WindowGroup {
            NavigationStack {
                ListView()
                    .environmentObject(listViewModel)
            }
        } */
    }
}
