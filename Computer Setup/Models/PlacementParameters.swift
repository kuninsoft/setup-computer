//
//  PlacementParameters.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI
import RealityKit
import Combine

class PlacementParameters: ObservableObject {
    @Published var selectedModel: Entity?
    @Published var confirmedModel: Entity?
    
    var sceneObserver: Cancellable?
}
