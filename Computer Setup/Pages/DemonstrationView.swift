//
//  DemonstrationView.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI
import RealityKit
import Combine

struct DemonstrationView<FollowingView: View>: View {
    @EnvironmentObject var placementSettings: PlacementParameters
    
    @State private var isNavigated = false
    @State private var isModelPlaced = false
    
    let title: String
    let actionText: String
    let component: ComponentType
    
    @ViewBuilder let followingView: () -> FollowingView
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                ZStack {
                    ARViewContainer()
                    
                    VStack {
                        Spacer()
                        
                        if placementSettings.selectedModel == nil && !isModelPlaced {
                            Button {
                                self.placementSettings.selectedModel = loadModel(component: self.component)
                            } label: {
                                Text("Add Model")
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.white)
                                    .padding(20)
                                    .background(Color("SecondaryColor"))
                                    .clipShape(Capsule())
                            }
                            .padding()
                        } else if placementSettings.selectedModel != nil && !isModelPlaced {
                            Button {
                                self.placementSettings.confirmedModel = self.placementSettings.selectedModel
                                self.placementSettings.selectedModel = nil
                                
                                self.isModelPlaced = true
                            } label: {
                                Text("Confirm Position")
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.white)
                                    .padding(20)
                                    .background(Color("SecondaryColor"))
                                    .clipShape(Capsule())
                            }
                            .padding()
                        }
                    }
                }
                
                RoundedBlueButton(actionText) {
                    isNavigated = true
                }
                .navigationDestination(isPresented: $isNavigated) {
                    followingView()
                }
                .padding()
                .disabled(!isModelPlaced)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func loadModel(component: ComponentType) -> Entity {
        guard let scene = try? getEntityLoader(component: component)() else {
            fatalError()
        }
        
        for child in scene.children {
            child.scale *= 0.055
        }
        
        return scene
    }
    
    func getEntityLoader(component: ComponentType) -> (() throws -> Entity) {
        switch component {
        case .cpu:
            return SetupComputer.loadCPUToMotherboard
        case .gpu:
            return SetupComputer.loadGPUToMB
        case .fan:
            return SetupComputer.loadFanToMB
        case .ram:
            return SetupComputer.loadRAMToMotherboard
        case .pcCase:
            return SetupComputer.loadMBToCase
        }
    }
}
