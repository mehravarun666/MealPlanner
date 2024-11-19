//
//  MealPlannerView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

struct MealPlannerView: View {
    @State private var meals: [String] = ["Breakfast", "Lunch", "Dinner"]
    @State private var selectedMeal: String = ""
    
    var body: some View {
        VStack {
            Text("Meal Planner")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            List(meals, id: \.self) { meal in
                Button(action: {
                    selectedMeal = meal
                }) {
                    Text(meal)
                        .font(.headline)
                }
            }
            
            if !selectedMeal.isEmpty {
                Text("Selected Meal: \(selectedMeal)")
                    .padding()
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Meal Planner")
    }
}
