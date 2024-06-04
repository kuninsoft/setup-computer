//
//  GatherComponentsView.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI

struct GatherComponentsView: View {
    @EnvironmentObject var placementSettings: PlacementParameters
    
    @State private var isNavigated = false
    
    let components = [
        RequiredComponent(name: "CPU", requiredCount: "1", iconSource: "cpu.fill"),
        RequiredComponent(name: "RAM sticks", requiredCount: "1-4", iconSource: "memorychip.fill"),
        RequiredComponent(name: "Motherboard", requiredCount: "1", iconSource: "memorychip.fill"),
        RequiredComponent(name: "Graphics Card (GPU)", requiredCount: "1", iconSource: "memorychip.fill"),
        RequiredComponent(name: "CPU Cooler", requiredCount: "1", iconSource: "fan.fill"),
        RequiredComponent(name: "Disk Drive (HDD or SSD)", requiredCount: "1-2", iconSource: "internaldrive.fill"),
        RequiredComponent(name: "Computer Case", requiredCount: "1", iconSource: "ipad.case"),
        RequiredComponent(name: "Thermal Paste", requiredCount: "1", iconSource: "syringe.fill"),
    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Text("To start, first you need to gather these essential components for your new system installation:")
                    .padding(32)
                
                ScrollView {
                    Grid (alignment: .leadingFirstTextBaseline) {
                        ForEach(components, id: \.self.name) { component in
                            GridRow {
                                Image(systemName: component.iconSource)
                                
                                Text("\(component.requiredCount)x \(component.name)")
                                    .foregroundStyle(Color("SecondaryColor"))
                                    .bold()
                            }
                            .padding(10)
                            
                            Divider()
                        }
                    }
                }
                
                Spacer()
                
                RoundedBlueButton("Next") {
                    isNavigated = true
                }
                .navigationDestination(isPresented: $isNavigated) {
                    InstructionsStepBuilder().getSteps()
                }
                .padding()
            }
        }
        .navigationTitle("Gather Components")
    }
}

#Preview {
    GatherComponentsView()
}
