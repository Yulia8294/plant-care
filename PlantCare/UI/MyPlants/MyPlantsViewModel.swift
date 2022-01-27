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
    
    private let coordinator: MyPlantsCoordinator!
    
    init(coordinator: MyPlantsCoordinator) {
        self.coordinator = coordinator
    }
    
    private var plants = [Plant]() {
        didSet {
            groupPlantsByRoom()
        }
    }
    
    private var groupedPlants = [[Plant]]()
    
    var reload: (() -> Void)?
    
    var plantsCellViewModels = [[PlantCellViewModel]]() {
        didSet {
            reload?()
        }
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
    func getPlants() {
        plants = AppData.myPlants
        plantsCellViewModels = groupedPlants.map { $0.map { createCellModel(plant: $0) } }
    }
    
    private func groupPlantsByRoom() {
        groupedPlants = Dictionary(grouping: plants, by: { plant in
            plant.room
        }).map {
            $0.value
        }
    }
    
    private func createCellModel(plant: Plant) -> PlantCellViewModel {
        PlantCellViewModel(image: plant.photo, title: plant.title)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PlantCellViewModel {
        plantsCellViewModels[indexPath.section][indexPath.row]
    }
    
    func getSectionHeaderTitle(for section: Int) -> String {
        groupedPlants[section].first?.room ?? ""
    }
    
    func didPressAddNewPlant() {
        coordinator.addPlant()
    }
}
