//
//  Item.swift
//  Nocti_MacOS
//
//  Created by Brandon Potts on 10/4/25.
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
