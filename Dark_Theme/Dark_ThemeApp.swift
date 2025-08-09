//
//  Dark_ThemeApp.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI

@main
struct Dark_ThemeApp: App {
    @AppStorage("appearance") private var appearance: Appearance = .system
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(changeAppearance())
        }
    }
    
    private func changeAppearance() -> ColorScheme? {
        print("Inside change Appearance function")
        switch appearance {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
        }
    }
}
