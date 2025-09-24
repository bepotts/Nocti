//
//  PersonalizationPage.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/12/25.
//

import SwiftUI

struct PersonalizationPage: View {
    @State private var selectedLightFile: URL?
    @State private var lightLabel: String = "Select a light theme file"
    @State private var selectedDarkFile: URL?
    @State private var darkLabel: String = "Select a dark theme file"

    var body: some View {
        VStack {
            HStack {
                Label("Light", systemImage: "sun.horizon.fill")
                importLightFileButton
                Spacer(minLength: 0)
                Text(lightLabel)
            }
            .padding()
            HStack {
                Label("Dark", systemImage: "moon.circle.fill")
                importDarkFileButton
                Spacer(minLength: 0)
                Text(darkLabel)
            }
        }
    }

    var importLightFileButton: some View {
        importButton(importFile: $selectedLightFile, labelName: $lightLabel)
    }

    var importDarkFileButton: some View {
        importButton(importFile: $selectedDarkFile, labelName: $darkLabel)
    }

    private struct importButton: View {
        @Binding var importFile: URL?
        @Binding var labelName: String
        @State private var isImporting = false
        var body: some View {
            Button("Select File") {
                print("import Button Pressed")
                isImporting = true
            }
            .fileImporter(isPresented: $isImporting, allowedContentTypes: [.item],
                          allowsMultipleSelection: false)
            { result in
                switch result {
                case let .success(urls):
                    importFile = urls.first
                    labelName = urls.first!.lastPathComponent
                    print("Picked File: \(importFile?.path ?? "")")
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    PersonalizationPage()
}
