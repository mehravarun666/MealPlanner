//
//  FavoritesView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var favoriteRecipes: [String] = ["Pasta", "Brownies"]
    
    var body: some View {
        VStack {
            Text("Favorite Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            if favoriteRecipes.isEmpty {
                Text("No favorites yet!")
                    .foregroundColor(.gray)
            } else {
                List(favoriteRecipes, id: \.self) { recipe in
                    Text(recipe)
                }
            }
        }
        .navigationTitle("Favorites")
    }
}
