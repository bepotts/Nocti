//
//  ThemeSwitchPage.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/12/25.
//

import SwiftUI
import SwiftData

struct ThemeSwitchPage: View {
//    @Binding var storedScheme: AppearancePref
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.modelContext) private var modelContext
    let schedule: ThemeSchedule = ThemeSchedule()
    
    var body: some View {
        VStack {
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
//        storedScheme = newColorScheme
        themeManager.colorScheme = newColorScheme
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
}

#Preview {
    ThemeSwitchPage()
}
