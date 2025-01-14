//
//  FoodModel.swift
//  EniFood
//
//  Created by Oleg Podrez on 14.01.25.
//

import SwiftData
import Foundation

@Model

class FoodModel {
    @Attribute(.unique) var id: UUID = UUID()
    var nameEniFood: String
    var category: String
    var ingredients: [String]
    var image: Data?
    
    init(id: UUID, name: String, category: String, ingredients: [String], image: Data? = nil) {
        self.id = id
        self.nameEniFood = name
        self.category = category
        self.ingredients = ingredients
        self.image = image
    }
}
