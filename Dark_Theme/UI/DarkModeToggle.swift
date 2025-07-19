//
//  DarkModeTogg.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/19/25.
//

import SwiftUI

struct DarkModeToggle: View {
    @State private var darkModeIsOn = false
    var body: some View {
        Toggle("Enable Dark Mode", isOn: $darkModeIsOn)
            .toggleStyle(SwitchToggleStyle())
            .onChange(of: darkModeIsOn) { newValue, oldValue in
                performDarkModeToggle(darkMode: darkModeIsOn)
            }
    }
    
    func performDarkModeToggle(darkMode: Bool) {
        if darkMode {
            print("Dark Mode Enabled")
        } else {
            print("Dark Mode Disabled")
        }
    }
}
