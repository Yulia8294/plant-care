//
//  MyPlantsViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

struct PlantCellViewModel {
    let image: UIImage
    let title: String
}

class MyPlantsViewModel: NSObject {
    
    var coordinator: MyPlantsCoordinator!
    
    var plants = [Plant]()
    
    var reload: (() -> Void)?
    
    var plantsCellViewModels = [PlantCellViewModel]() {
        didSet {
            reload?()
        }
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
    func getPlants() {
        plants = AppData.myPlants
        plantsCellViewModels = plants.map { createCellModel(plant: $0) }
    }
    
    private func createCellModel(plant: Plant) -> PlantCellViewModel {
        PlantCellViewModel(image: plant.photo, title: plant.title)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PlantCellViewModel {
        plantsCellViewModels[indexPath.row]
    }
    
    func didPressAddNewPlant() {
        coordinator.addPlant()
    }
}
