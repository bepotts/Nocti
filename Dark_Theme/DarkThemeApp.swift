//
//  Dark_ThemeApp.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI

@main
struct DarkThemeApp: App {
    @AppStorage("appearance") private var appearance: AppearancePref = .system
    
    init() {
        // This resets the @AppStorage each run when the "-reset-defaults" argument is sent during launch
        if ProcessInfo.processInfo.arguments.contains("-reset-defaults") {
            if let bundle = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundle)
                UserDefaults.standard.synchronize()
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView(storedScheme: $appearance)
                .modifier(AppAppearance(pref: appearance))
        }
    }
    
    func clearAppKitOverrides() {
        print("Clearning AppKit Overrides")
        NSApp.appearance = nil
        NSApplication.shared.windows.forEach { $0.appearance = nil }
    }
}

struct AppAppearance: ViewModifier {
    let pref: AppearancePref
    func body(content: Content) -> some View {
        switch pref {
        case .system:
            content
        case .light:
            content.preferredColorScheme(.light)
        case .dark:
            content.preferredColorScheme(.dark)
        }
    }
    
    func clearAppKitOverrides() {
        NSApp.appearance = nil
        NSApplication.shared.windows.forEach { $0.appearance = nil }
    }
}
