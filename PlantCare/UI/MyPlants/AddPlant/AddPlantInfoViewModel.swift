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
    
    let placeholderImage = R.image.plantPlaceholder()!
    
    @Published var room: Room = .defaultRooms.first!
    @Published var capturedImage: UIImage?
    @Published var name: String = ""
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2022/01/28 11:31")
        let image = ImageData(withImage: capturedImage ?? placeholderImage)
        
        let plant = Plant(id: UUID().uuidString,
                          title: name,
                          photo: image,
                          age: 1,
                          dateAquired: Date(),
                          lastWatering: someDateTime!,
                          wateringCycle: wateringCycle,
                          room: room)
        
        AppData.myPlants.append(plant)
    }
    
}
