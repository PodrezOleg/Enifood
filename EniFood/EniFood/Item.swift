//
//  Item.swift
//  EniFood
//
//  Created by Oleg Podrez on 1.01.25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
