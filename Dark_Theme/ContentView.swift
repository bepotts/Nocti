//
//  ContentView.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    let schedule: ThemeSchedule = ThemeSchedule()
    var body: some View {
        VStack {
            DarkModeToggle()
            TimePicker(schedule: schedule)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
