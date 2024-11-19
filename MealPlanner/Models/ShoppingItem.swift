//
//  ShoppingItem.swift
//  MealPlanner
//
//  Created by Varun Mehra on 19/11/24.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id = UUID()
    let name: String
    var isChecked: Bool = false
}
