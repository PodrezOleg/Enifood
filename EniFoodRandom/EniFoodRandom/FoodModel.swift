//
//  FoodModel.swift
//  EniFoodRandom
//
//  Created by Oleg Podrez on 14.01.25.
//

import SwiftData
import Foundation

@Model

class FoodModel {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var category: String
    var ingredients: [String]
    var image: Data?
    
    init(id: UUID, name: String, category: String, ingredients: [String], image: Data? = nil) {
        self.id = id
        self.name = name
        self.category = category
        self.ingredients = ingredients
        self.image = image
    }
}
