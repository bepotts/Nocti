//
//  Dark_ThemeApp.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI

@main
struct DarkThemeApp: App {
    @AppStorage("appearance") private var appearance: Appearance = .system
    @State private var currentTheme: ColorScheme? = nil
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme
    
    init() {
        // This resets the @AppStorage each run when the "-reset-defaults" argument is sent during launch
        if ProcessInfo.processInfo.arguments.contains("-reset-defaults") {
            print("Inside Process info if statment")
            if let bundle = Bundle.main.bundleIdentifier {
                print("Resetting UserDefaults")
                UserDefaults.standard.removePersistentDomain(forName: bundle)
                UserDefaults.standard.synchronize()
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView(currentColorScheme: $currentTheme)
                .preferredColorScheme(currentTheme)
        }
    }
    
    private func changeAppearance() -> ColorScheme? {
        
        if appearance == .system {
            return nil
        }
        
        print("Inside change Appearance function")
        switch appearance {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return systemColorScheme
        }
    }
}
