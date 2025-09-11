//
//  WallpaperPage.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/12/25.
//

import SwiftUI

struct PersonalizationPage: View {
    @State private var selectedLightFile: URL?
    @State private var selectedDarkFile: URL?
    
    var body: some View {
        VStack {
            HStack {
                Label("Light", systemImage: "sun.horizon.fill")
                importDarkFileButton
            }
            .padding()
            HStack {
                Label("Dark", systemImage: "moon.circle.fill")
                importLightFileButton
            }
        }
    }
    
    var importLightFileButton: some View {
        importButton(importFile: $selectedLightFile)
    }
    
    var importDarkFileButton: some View {
        importButton(importFile: $selectedDarkFile)
    }
    
    private struct importButton: View {
        @Binding var importFile: URL?
        @State private var isImporting = false
        var body: some View {
            Button("Select File") {
               print("import Button Pressed")
                isImporting = true
           }
           .fileImporter(isPresented: $isImporting, allowedContentTypes: [.item],
                         allowsMultipleSelection: false) { result in
               switch result {
               case .success(let urls):
                   importFile = urls.first
                   print("Picked File: \(importFile?.path ?? "")")
               case .failure(let error):
                   print("Error: \(error.localizedDescription)")
               }
           }
        }
    }
}


#Preview {
    PersonalizationPage()
}
