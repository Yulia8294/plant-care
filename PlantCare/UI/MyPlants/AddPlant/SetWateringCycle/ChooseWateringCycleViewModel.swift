//
//  ChooseWateringCycleViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import Foundation

class ChooseWateringCycleViewModel: NSObject {
    
    let coordinator: AddPlantCoordinator
    let viewModel: AddPlantInfoViewModel
    
    let title = "Choose watering cycle for your plant"
    
    init(coordinator: AddPlantCoordinator, viewModel: AddPlantInfoViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
    }
    
    let cycles = WateringCycle.allCases
    
    var reload: (() -> Void)?
    
    func screenWillAppear() {
        viewModel.currentStep = .wateringCycle
    }
        
    func didSelectCell(at indexPath: IndexPath) {
        viewModel.wateringCycle = cycles[indexPath.row]
        viewModel.stepCompleted()
    }
    
    func getCycle(for indexPath: IndexPath) -> WateringCycle {
        cycles[indexPath.row]
    }
}
