//
//  InstructionImporter.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import Foundation

class InstructionImporter {
    static func importInstruction(instructionName: String) -> String {
        guard let path = Bundle.main.url(forResource: instructionName, withExtension: "txt") else {
            return "Failed to read instruction file \(instructionName).txt: Doesn't exist."
        }
        
        return (try? String(contentsOf: path, encoding: .utf8)) ?? "Failed to read instruction file \(instructionName).txt"
    }
}
