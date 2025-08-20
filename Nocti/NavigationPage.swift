//
//  ContentView.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI
import SwiftData

struct NavigationPage: View {
//    @Binding var storedScheme: AppearancePref
//    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Schedule", destination: ThemeSwitchPage())
                NavigationLink("Personalization", destination: PersonalizationPage())
            }
            .navigationTitle(Text("Menu"))
        } detail: {
            Text("Select an option from the menu on the left.")
        }
    }
}

#Preview {
    NavigationPage()
}
