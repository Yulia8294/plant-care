//
//  CapturePlantViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit
import Combine

enum AddPlantStep: CaseIterable {
    case room
    case image
    case title
    case wateringCycle
}

class AddPlantInfoViewModel: NSObject {
        
    let coordinator: AddPlantCoordinator
    var currentStep: AddPlantStep = .room
    
    let placeholderImage = R.image._PlantImage()!
    
    @Published var room: Room?
    @Published var capturedImage: UIImage? {
        didSet {
            print("New plant image is set")
        }
    }
    
    @Published var name: String = "Nice Plant" {
        didSet {
            print(name)
        }
    }
    @Published var wateringCycle: WateringCycle = .daily
    
    init(coordinator: AddPlantCoordinator) {
        self.coordinator = coordinator
    }
    
    func stepCompleted() {
        switch currentStep {
        case .room:
            coordinator.showPlantPictureScreen(viewModel: self)
        case .image:
            coordinator.showTitleScreen(viewModel: self)
        case .title:
            coordinator.showWateringCycleScreen(viewModel: self)
        case .wateringCycle:
            createPlant()
            coordinator.completePlantAdding()
        }
    }
    
    func createPlant() {
        let plant = Plant(title: name, photo: capturedImage ?? R.image._PlantImage()!, age: 1, dateAquired: Date(), lastWatering: Date(), wateringCycle: 1)
        AppData.myPlants.append(plant)
    }
    
}
