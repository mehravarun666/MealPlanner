//
//  ShoppingListView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var shoppingItems: [String] = []
    @State private var newItem: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("New Item", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                    if !newItem.isEmpty {
                        shoppingItems.append(newItem)
                        newItem = ""
                    }
                }
                .padding()
            }
            .padding()

            List {
                ForEach(shoppingItems, id: \.self) { item in
                    Text(item)
                }
                .onDelete { indexSet in
                    shoppingItems.remove(atOffsets: indexSet)
                }
            }
        }
        .navigationTitle("Shopping List")
    }
}
