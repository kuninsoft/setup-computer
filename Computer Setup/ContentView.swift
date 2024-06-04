//
//  ContentView.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI
import RealityKit

struct ContentView: View {   
    @State private var isNavigated = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Hello!")
                        .font(.largeTitle)
                    
                    Spacer()

                    RoundedBlueButton("Start Installation") {
                        isNavigated = true
                    }
                    .navigationDestination(isPresented: $isNavigated) {
                        GatherComponentsView()
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
