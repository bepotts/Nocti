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
    @State private var darkModeIsOn: Bool = false
    @AppStorage("appearance") private var appearance: Appearance?
    
    let schedule: ThemeSchedule = ThemeSchedule()
    var body: some View {
        VStack {
            Toggle("Enable Dark Mode", isOn: $darkModeIsOn)
                .toggleStyle(SwitchToggleStyle())
                .onChange(of: darkModeIsOn) { newValue, oldValue in
                    performDarkModeToggle(darkMode: darkModeIsOn)
                }
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
    
    func performDarkModeToggle(darkMode: Bool) {
        if darkMode {
            appearance = .dark
        } else {
            appearance = .light
        }
    }
}

#Preview {
    ContentView()
}
