//
//  ContentView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 17/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Title and Introduction
                Text("Recipe & Meal Planner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center) // Align text in the center
                    .foregroundColor(.primary)
                
                Text("Plan your meals, find new recipes, and create shopping lists.")
                    .font(.body)
                    .padding(.bottom)
                    .multilineTextAlignment(.center) // Align text in the center
                    .foregroundColor(.secondary)
                
                // Navigation Buttons for Meal Planner, Recipe Finder, Shopping List, and Favorites
                VStack(spacing: 16) { // Add vertical spacing between button rows
                    HStack(spacing: 16) { // Add horizontal spacing between buttons
                        NavigationLink(destination: MealPlannerView()) {
                            HomeButtonView(title: "Meal Planner", imageName: "calendar")
                        }
                        
                        NavigationLink(destination: RecipeFinderView()) {
                            HomeButtonView(title: "Recipe Finder", imageName: "magnifyingglass")
                        }
                    }
                    
                    HStack(spacing: 16) { // Add horizontal spacing between buttons
                        NavigationLink(destination: ShoppingListView()) {
                            HomeButtonView(title: "Shopping List", imageName: "cart")
                        }
                        
                        NavigationLink(destination: FavoritesView()) {
                            HomeButtonView(title: "Favorites", imageName: "star.fill")
                        }
                    }
                }
                .padding()
            }
            .padding() // Add padding around the entire VStack
            .navigationBarTitle("Home", displayMode: .inline) // Add a title for NavigationView
        }
    }
}

struct HomeButtonView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 40))
                .frame(width: 80, height: 80)
                .background(Circle().fill(Color.blue.opacity(0.1)))
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.blue, lineWidth: 2)
        )
    }
}

// Placeholder Views for Navigation (Meal Planner, Recipe Finder, Shopping List, Favorites)


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
