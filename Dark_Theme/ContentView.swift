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
        HStack {
            Button (action: {
                print("Save Button Pressed")
                saveSchedule()
            }) {
                Text("Save")
            }
        }
    }
    
    func saveSchedule() {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        modelContext.insert(schedule)
        
        do {
            try modelContext.save()
            print("Model Saved")
        } catch {
            print("Error saving the model: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
