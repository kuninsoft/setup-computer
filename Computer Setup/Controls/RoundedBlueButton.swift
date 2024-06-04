//
//  RoundedBlueButton.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI

struct RoundedBlueButton: View {
    let text: String
    let action: () -> Void
    
    init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            Text(text)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding(20)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    RoundedBlueButton("Hello, world!") {
        
    }
}
