//
//  RecipeFinderView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

struct RecipeFinderView: View {
    @State private var searchText: String = ""
    @State private var recipes: [String] = ["Pasta", "Pizza", "Salad"]
    
    var body: some View {
        VStack {
            TextField("Search Recipes", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(recipes.filter {
                searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
            }, id: \.self) { recipe in
                Text(recipe)
            }
        }
        .navigationTitle("Recipe Finder")
    }
}
