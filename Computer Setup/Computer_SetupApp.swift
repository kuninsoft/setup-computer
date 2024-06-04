//
//  Computer_SetupApp.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI

@main
struct Computer_SetupApp: App {
    @StateObject var placementSettings = PlacementParameters()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
        }
    }
}
