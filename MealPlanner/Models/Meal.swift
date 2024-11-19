//
//  Meal.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import Foundation

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let recipes: [Recipe]
}
