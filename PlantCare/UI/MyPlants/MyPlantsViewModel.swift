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
            AppData.myPlants = plants
            groupPlantsByRoom()
            generateCellViewModels()
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
        coordinator.showPlantDetails(groupedPlants[indexPath.section][indexPath.row])
    }
    
    func getPlants() {
        plants = InDefaultsStorage.myPlants
        reload?()
    }
    
    func deleteItem(at indexPath: IndexPath) {
        let item = groupedPlants[indexPath.section][indexPath.row]
        if let index = plants.firstIndex(where: { $0.id == item.id }) {
            plants.remove(at: index)
        }
        reload?()
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
    
    
    //MARK: - Private
    
    private func generateCellViewModels() {
        plantsCellViewModels = groupedPlants.map { $0.map { createCellModel(plant: $0) } }
    }
    
    private func groupPlantsByRoom() {
        groupedPlants = Dictionary(grouping: plants, by: { plant in
            plant.room
        })
            .sorted(by: { $0.key < $1.key })
            .map { $0.value }
    }
    
    private func createCellModel(plant: Plant) -> PlantCellViewModel {
        PlantCellViewModel(image: plant.photo.getImage() ?? R.image.plantPlaceholder()!, title: plant.title)
    }
}
