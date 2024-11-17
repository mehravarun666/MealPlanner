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
                    .foregroundColor(.primary)
                
                Text("Plan your meals, find new recipes, and create shopping lists.")
                    .font(.body)
                    .padding(.bottom)
                    .foregroundColor(.secondary)
                
                // Meal Planner, Recipe Finder, and Shopping List buttons
                HStack {
                    NavigationLink(destination: MealPlannerView()) {
                        HomeButtonView(title: "Meal Planner", imageName: "calendar")
                    }
                    
                    NavigationLink(destination: RecipeFinderView()) {
                        HomeButtonView(title: "Recipe Finder", imageName: "magnifyingglass")
                    }
                }
                .padding()

                HStack {
                    NavigationLink(destination: ShoppingListView()) {
                        HomeButtonView(title: "Shopping List", imageName: "cart")
                    }
                    
                    NavigationLink(destination: FavoritesView()) {
                        HomeButtonView(title: "Favorites", imageName: "star.fill")
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
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
        .background(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.blue, lineWidth: 2))
    }
}

// Placeholder Views for navigation (Meal Planner, Recipe Finder, Shopping List)
struct MealPlannerView: View {
    var body: some View {
        Text("Meal Planner View")
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}

struct RecipeFinderView: View {
    var body: some View {
        Text("Recipe Finder View")
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}

struct ShoppingListView: View {
    var body: some View {
        Text("Shopping List View")
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}

struct FavoritesView: View {
    var body: some View {
        Text("Favorites View")
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
