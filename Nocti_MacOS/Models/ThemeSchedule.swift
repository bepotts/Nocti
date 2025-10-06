//
//  ThemeSchedule.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/20/25.
//

import SwiftData
import SwiftUI

@Model
class ThemeSchedule {
    var darkSchedule: Date
    var lightSchedule: Date

    init() {
        var lightComponents = DateComponents()
        lightComponents.hour = 8
        lightComponents.minute = 0

        var darkComponents = DateComponents()
        darkComponents.hour = 20
        darkComponents.minute = 0

        darkSchedule = Calendar.current.date(from: darkComponents)!
        lightSchedule = Calendar.current.date(from: lightComponents)!
    }
}
