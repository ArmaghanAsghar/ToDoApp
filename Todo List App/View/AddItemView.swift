//
//  AddView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/3/24.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var textValue: String = ""
    @State var isAlertPresented: Bool = false
    @State var alertText: String = ""
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add text for item", text: $textValue)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)
                    .frame(width: .infinity, height: 55)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                Button(action: {
                    // Do something.
                    addNewItem(title: textValue)
                    
                }, label: {
                    Text("Save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .tint(Color.white)
                })
                .alert("Ops! Didn't add anything...",
                       isPresented: $isAlertPresented) {
                    Text("Dismiss")
                }
                       
                
            }
            
            .padding()
            
        }
        .navigationTitle("Add an Item")
    }
   
    func addNewItem(title: String) {
        
        if checkInputValid() {
            listViewModel.addNewItem(title: textValue)
            dismiss()
        } else {
            isAlertPresented = true
            textValue = ""
        }
        
    }
    
    private func checkInputValid() -> Bool {
        if textValue.count < 3 {
            return false
        }
        
        return true
    }
}

#Preview {
    NavigationStack {
        AddItemView()
            .environmentObject(ListViewModel())
    }
   
}
