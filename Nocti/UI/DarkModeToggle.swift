//
//  DarkModeTogg.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/19/25.
//

import SwiftUI

struct DarkModeToggle: View {
    @Binding var darkModeIsOn: Bool
    var body: some View {
        Toggle("Enable Dark Mode", isOn: $darkModeIsOn)
            .toggleStyle(SwitchToggleStyle())
    }
}
