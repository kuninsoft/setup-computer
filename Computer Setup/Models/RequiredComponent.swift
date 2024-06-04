//
//  RequiredComponent.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import Foundation

struct RequiredComponent {
    let name: String
    
    // This is a string because it can be not only a specific number (x1, x2), but a range (e.g. x1-4)
    let requiredCount: String
    
    let iconSource: String
}
