//
//  Enums.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/8/25.
//

enum Appearance: String, CaseIterable, Identifiable {
    var id: Self { self }
    case system
    case light
    case dark
}
