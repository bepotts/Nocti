//
//  TimePicker.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/19/25.
//

import SwiftUI

struct TimePicker: View {
    
    @State private var date: Date = Date()
    var body: some View {
        Text("TimePicker")
        DatePicker("Please Enter a Date", selection: $date, displayedComponents: .hourAndMinute)
    }
}
