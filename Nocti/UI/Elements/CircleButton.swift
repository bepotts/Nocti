//
//  CircleButtonElement.swift
//  Dark Theme
//
//  Created by Brandon Potts on 8/9/25.
//

import SwiftUI

struct CircleButton: View {
    
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle().fill(color)
        }
        .frame(width: 60, height: 60)
        .buttonStyle(PlainButtonStyle())
        .onHover { inside in
            if inside {
                NSCursor.pointingHand.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}

#Preview {
    CircleButton(action: {})
}
