//
//  Item.swift
//  TaskSwiftData
//
//  Created by usradmin on 17/9/24.
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
