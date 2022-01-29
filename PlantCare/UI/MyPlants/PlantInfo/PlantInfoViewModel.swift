//
//  PlantInfoViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import UIKit

class PlantInfoViewModel {
    
    private let plant: Plant
    private let coordinator: MyPlantsCoordinator
    
    var plantViewModel: PlantDetailViewModel
    
    init(coordinator: MyPlantsCoordinator, plant: Plant) {
        self.coordinator = coordinator
        self.plant = plant
        self.plantViewModel = PlantDetailViewModel(name: plant.title,
                                                   photo: plant.photo.getImage(),
                                                   lastWatering: plant.lastWatering,
                                                   wateringCycle: plant.wateringCycle,
                                                   roomTitle: plant.room.title)
    }
}
