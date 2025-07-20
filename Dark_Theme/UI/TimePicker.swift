//
//  TimePicker.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/19/25.
//

import SwiftUI

struct TimePicker: View {
    
    @State private var darkTime: Date = defaultDarkTime()
    @State private var lightTime: Date = defaultLightTime()
    var body: some View {
        VStack {
            DatePicker("Light Mode", selection: $lightTime, displayedComponents: .hourAndMinute)
            DatePicker("Dark Mode", selection: $darkTime, displayedComponents: .hourAndMinute)
        }
    }
    
    static func defaultLightTime() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        return Calendar.current.date(from: components)!
    }
    
    static func defaultDarkTime() -> Date {
        var components = DateComponents()
        components.hour = 20
        components.minute = 0
        return Calendar.current.date(from: components)!
    }
}
