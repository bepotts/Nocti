//
//  Enums.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/8/25.
//

import SwiftUI

//
// enum Appearance: String, CaseIterable, Identifiable {
//    var id: Self { self }
//    case system
//    case light
//    case dark
//
//    func convertAppearanceToColorScheme() -> ColorScheme {
//        switch self {
//        case .light:
//            return .light
//        case .dark:
//            return .dark
//        default:
//            return .light
//        }
//    }
//
//    static func convertColorSchemeToAppearance(_ colorScheme: ColorScheme) -> Appearance {
//        switch colorScheme {
//        case .light:
//            return .light
//        case .dark:
//            return .dark
//        @unknown default:
//            return .light
//        }
//    }
//
// }

enum AppearancePref: String { case system, light, dark }
