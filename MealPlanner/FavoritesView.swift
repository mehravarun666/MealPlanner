//
//  FavoritesView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

import SwiftUI

struct FavoritesView: View {
    @State private var favoriteRecipes: [String] = ["Pasta", "Brownies"]
    @State private var newRecipe: String = ""
    @State private var showAddRecipeSheet: Bool = false
    @State private var selectedRecipe: String?
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Favorite Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Add Button
                HStack {
                    TextField("Add a new recipe", text: $newRecipe)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .vertical])
                    
                    Button(action: {
                        if !newRecipe.isEmpty {
                            favoriteRecipes.append(newRecipe)
                            newRecipe = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.green)
                    }
                    .padding(.trailing)
                }
                
                // No Favorites Message
                if favoriteRecipes.isEmpty {
                    VStack {
                        Image(systemName: "star.slash.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                        
                        Text("No favorites yet!")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    // Favorite List
                    List {
                        ForEach(favoriteRecipes, id: \.self) { recipe in
                            HStack {
                                Text(recipe)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Button(action: {
                                    selectedRecipe = recipe
                                    showAddRecipeSheet.toggle()
                                }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .onDelete(perform: deleteRecipe)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddRecipeSheet) {
                if let recipe = selectedRecipe {
                    RecipeDetailView(recipe: recipe)
                }
            }
        }
    }
    
    // Delete a recipe
    private func deleteRecipe(at offsets: IndexSet) {
        favoriteRecipes.remove(atOffsets: offsets)
    }
}

struct RecipeDetailView: View {
    var recipe: String
    
    var body: some View {
        VStack {
            Text(recipe)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Details about \(recipe) will go here.")
                .font(.body)
                .padding()
            
            Spacer()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

