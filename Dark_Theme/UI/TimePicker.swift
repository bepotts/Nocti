//
//  TimePicker.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/19/25.
//

import SwiftUI
import SwiftData

struct TimePicker: View {
    
    @State var schedule: ThemeSchedule
    var body: some View {
        VStack {
            DatePicker("Light Mode", selection: $schedule.lightSchedule, displayedComponents: .hourAndMinute)
            DatePicker("Dark Mode", selection: $schedule.darkSchedule, displayedComponents: .hourAndMinute)
        }
    }
}

#Preview {
    TimePicker(schedule: ThemeSchedule())
}
