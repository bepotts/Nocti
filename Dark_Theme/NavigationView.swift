//
//  ContentView.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI
import SwiftData

struct NavigationView: View {
    @Binding var storedScheme: AppearancePref
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Schedule Switch", destination: ThemeSwitchPage(storedScheme: $storedScheme))
                NavigationLink("Wallpaper Settings", destination: WallpaperPage())
            }
            .navigationTitle(Text("Menu"))
        } detail: {
            Text("Select an option from the menu on the left.")
        }
    }
}

#Preview {
    NavigationView(storedScheme: .constant(.light) as Binding<AppearancePref>)
}
