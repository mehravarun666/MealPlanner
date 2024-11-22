//
//  MealPlannerView.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import SwiftUI

struct MealPlannerView: View {
    @State private var meals: [String] = ["Breakfast", "Lunch", "Dinner"]
    @State private var newMeal: String = ""
    @State private var selectedMeal: String? = nil
    @State private var showMealDetails: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Meal Planner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Add New Meal Section
                HStack {
                    TextField("Add a new meal", text: $newMeal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .vertical])

                    Button(action: {
                        if !newMeal.isEmpty {
                            meals.append(newMeal)
                            newMeal = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.green)
                    }
                    .padding(.trailing)
                }

                // Meal List
                if meals.isEmpty {
                    VStack {
                        Image(systemName: "leaf.arrow.circlepath")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)

                        Text("No meals planned yet!")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(meals, id: \.self) { meal in
                            HStack {
                                Text(meal)
                                    .font(.headline)

                                Spacer()

                                Button(action: {
                                    selectedMeal = meal
                                    showMealDetails.toggle()
                                }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .onDelete(perform: deleteMeal)
                    }
                }

                // Selected Meal Info
                if let meal = selectedMeal {
                    Text("Selected Meal: \(meal)")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            .padding(.horizontal)
            .navigationTitle("Meal Planner")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showMealDetails) {
                if let meal = selectedMeal {
                    MealDetailView(meal: meal)
                }
            }
        }
    }

    // Delete a Meal
    private func deleteMeal(at offsets: IndexSet) {
        meals.remove(atOffsets: offsets)
    }
}

// Meal Detail View
struct MealDetailView: View {
    var meal: String

    var body: some View {
        VStack {
            Text(meal)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Details and nutritional information about \(meal) will go here.")
                .font(.body)
                .padding()

            Spacer()
        }
    }
}

// Preview
struct MealPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlannerView()
    }
}

