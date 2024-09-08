//
//  NoItemView.swift
//  Todo List App
//
//  Created by Armaghan Asghar on 9/7/24.
//

import SwiftUI

struct NoItemView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isAnimate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No Items to display.")
                NavigationLink(
                    destination: AddItemView()
                        .environmentObject(listViewModel)
                ) {
                    Text("Add something")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(isAnimate ? Color.red : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .tint(Color.white)
                        .scaleEffect(isAnimate ? 1.1 : 1.0)
                        
                }
            }
            .padding(40)
        }
        .onAppear(perform: performAnimation)
    }
    
    /// This function will execute everytime we
    /// would be presenting this view
    private func performAnimation() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()) {
                        isAnimate.toggle()
                    }
        }
        
    }
}

#Preview {
    NavigationStack {
        NoItemView()
    }
    .navigationTitle("Title")
    
   
}
