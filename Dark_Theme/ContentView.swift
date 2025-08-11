//
//  ContentView.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("appearance") private var storedScheme: Appearance?
    @Binding var currentColorScheme: ColorScheme?
    @Environment(\.colorScheme) var environmentColorScheme
    @Environment(\.modelContext) private var modelContext
    @State private var darkModeIsOn: Bool = false
    let schedule: ThemeSchedule = ThemeSchedule()
    
    var body: some View {
        VStack {
            darkToggle
            TimePicker(schedule: schedule)
        }
        .padding()
        HStack {
            saveButton
        }
        .padding()
        VStack {
            HStack {
                CircleButton(action: { circleButtonTapped(.light) })
                CircleButton(color: .black, action: { circleButtonTapped(.dark) })
                CircleButton(action: { circleButtonTapped(nil) })
            }
        }
    }
    
    func circleButtonTapped(_ newColorScheme: ColorScheme?) {
        currentColorScheme = newColorScheme
        
        if let newColorScheme = newColorScheme {
            if newColorScheme == .light {
                storedScheme = .light
            } else {
                storedScheme = .dark
            }
        } else {
            currentColorScheme = systemColorScheme()
            storedScheme = .system
        }
    }
    
    var darkToggle: some View {
        Toggle("Enable Dark Mode", isOn: $darkModeIsOn)
            .toggleStyle(SwitchToggleStyle())
            .onChange(of: darkModeIsOn) { newValue, oldValue in
                performDarkModeToggle(darkMode: darkModeIsOn)
            }
    }
    
    var saveButton: some View {
        Button (action: {
            print("Save Button Pressed")
            saveSchedule()
        }) {
            Text("Save")
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
        print("Inside the Dark Mode Toggle function")
        if darkMode {
            currentColorScheme = .dark
            storedScheme = .dark
        } else {
            currentColorScheme = .light
            storedScheme = .light
        }
    }
    
    func systemColorScheme() -> ColorScheme {
        let match = NSApp.effectiveAppearance.bestMatch(from: [.darkAqua, .aqua])
        return match == .darkAqua ? .dark : .light
    }
}

#Preview {
    ContentView(currentColorScheme: .constant(nil) as Binding<ColorScheme?>)
}
