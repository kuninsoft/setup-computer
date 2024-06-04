//
//  ARViewContainer.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementParameters
    
    @State private var arView: CustomARView?
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { event in
            self.updateScene(for: arView)
        })
        
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    private func updateScene(for arView: CustomARView) {
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        if let confirmedModel = self.placementSettings.confirmedModel {
            self.place(confirmedModel, in: arView)
            
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ entity: Entity, in arView: ARView) {
        let clonedEntity = entity.clone(recursive: true)
        
        clonedEntity.generateCollisionShapes(recursive: true)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
        print("Added entity to the scene.")
    }
}
