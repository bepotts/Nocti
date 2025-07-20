//
//  ContentView.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DarkModeToggle()
            TimePicker()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
