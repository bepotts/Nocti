//
//  NavigationPage.swift
//  Dark Theme
//
//  Created by Brandon Potts on 7/18/25.
//

import SwiftData
import SwiftUI

struct NavigationPage: View {
    enum Page: Hashable {
        case schedule
        case personalization
    }

    @State private var selection: Page? = .schedule

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: Page.schedule) {
                    Label("Schedule", systemImage: "calendar")
                }
                NavigationLink(value: Page.personalization) {
                    Label("Personalization", systemImage: "person.crop.circle")
                }
            }
            .navigationTitle(Text("Menu"))
        } detail: {
            switch selection {
            case .schedule:
                SchedulePage()
            case .personalization:
                PersonalizationPage()
            default:
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationPage()
}
