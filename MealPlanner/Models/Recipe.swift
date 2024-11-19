//
//  Recipe.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let steps: [String]
}
