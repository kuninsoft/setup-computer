//
//  StepBuilder.swift
//  Computer Setup
//
//  Created by Sviatoslav Kunynets
//

import SwiftUI

class InstructionsStepBuilder {
    func getSteps() -> some View {
        return createCpuInstructions()
    }
    
    private func createCpuInstructions() -> some View {
        return InstructionView(title: "Installing Processor",
                               description: InstructionImporter.importInstruction(instructionName: "cpu_instructions"),
                               actionText: "Demonstrate") {
            self.createCpuDemonstration()
        }
    }
    
    private func createCpuDemonstration() -> some View {
        return DemonstrationView(title: "Installing Processor", actionText: "Next", component: .cpu) {
            self.createRamInstructions()
        }
    }
    
    private func createRamInstructions() -> some View {
        return InstructionView(title: "Installing RAM",
                               description: InstructionImporter.importInstruction(instructionName: "ram_instructions"),
                               actionText: "Demonstrate") {
            self.createRamDemonstration()
        }
    }
    
    private func createRamDemonstration() -> some View {
        return DemonstrationView(title: "Installing RAM", actionText: "Next", component: .ram) {
            self.createThermalPasteInstructions()
        }
    }
    
    private func createThermalPasteInstructions() -> some View {
        return InstructionView(title: "Applying Thermal Paste",
                               description: InstructionImporter.importInstruction(instructionName: "thermal_instructions"),
                               actionText: "Next") {
            self.createFanInstructions()
        }
    }
    
    private func createFanInstructions() -> some View {
        return InstructionView(title: "Installing CPU Cooler",
                               description: InstructionImporter.importInstruction(instructionName: "fan_instructions"),
                               actionText: "Demonstrate") {
            self.createFanDemonstration()
        }
    }
    
    private func createFanDemonstration() -> some View {
        return DemonstrationView(title: "Installing CPU Cooler", actionText: "Next", component: .fan) {
            self.createMotherboardToCaseInstructions()
        }

    }
    
    private func createMotherboardToCaseInstructions() -> some View {
        return InstructionView(title: "Mount Motherboard to Case",
                               description: InstructionImporter.importInstruction(instructionName: "mb_to_case_instructions"),
                               actionText: "Demonstrate") {
            self.createMotherboardToCaseDemonstration()
        }
    }
    
    private func createMotherboardToCaseDemonstration() -> some View {
        return DemonstrationView(title: "Mount Motherboard to Case", actionText: "Next", component: .pcCase) {
            self.createPowerBlockInstructions()
        }
    }
    
    private func createPowerBlockInstructions() -> some View {
        return InstructionView(title: "Install Power Block & Cables",
                               description: InstructionImporter.importInstruction(instructionName: "psu_instructions"),
                               actionText: "Next") {
            self.createGpuInstructions()
        }
    }
    
    private func createGpuInstructions() -> some View {
        return InstructionView(title: "Installing Graphics Card",
                               description: InstructionImporter.importInstruction(instructionName: "gpu_instructions"),
                               actionText: "Demonstrate") {
            self.createGpuDemonstration()
        }
    }
    
    private func createGpuDemonstration() -> some View {
        return DemonstrationView(title: "Installing Graphics Card", actionText: "Next", component: .gpu) {
            self.createDriveInstructions()
        }
    }
    
    private func createDriveInstructions() -> some View {
        return InstructionView(title: "Mounting Storage",
                               description: InstructionImporter.importInstruction(instructionName: "drive_instructions"),
                               actionText: "Next") {
            self.createCloseCaseInstructions()
        }
    }
    
    private func createCloseCaseInstructions() -> some View {
        return InstructionView(title: "Finishing Touches",
                               description: InstructionImporter.importInstruction(instructionName: "finish_instructions"),
                               actionText: "Finish") {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Done!")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text("Thank you for using the app!")
                        .font(.title)
                    
                    Spacer()
                }
            }
        }
    }
}
