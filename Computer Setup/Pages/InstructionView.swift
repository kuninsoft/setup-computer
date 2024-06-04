//
//  InstructionPage.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI

struct InstructionView<FollowingView: View>: View {
    @State private var isNavigated = false
    
    let title: String
    let description: String
    let actionText: String
    @ViewBuilder let followingView: () -> FollowingView
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text(description)
                        .padding()
                }
                
                Spacer()
                
                RoundedBlueButton(actionText) {
                    isNavigated = true
                }
                .navigationDestination(isPresented: $isNavigated) {
                    followingView()
                }
                .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        InstructionView(title: "Install CPU", description: "Lorem Ipsum", actionText: "Demonstrate") {
            Text("hi")
        }
    }
}
