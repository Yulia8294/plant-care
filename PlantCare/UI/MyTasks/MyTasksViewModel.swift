//
//  MyTasksViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import Combine

class MyTasksViewModel: NSObject {
    
    private let coordinator: MyTasksCoordinator!
    
    private var plantsWithTasks: [Plant] = []
    
    @Published var taskCellsViewModels = [PlantInfoViewModel]()
    
    init(coordinator: MyTasksCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchTasks() {
        plantsWithTasks = AppData.myPlants
        taskCellsViewModels = plantsWithTasks
            .map { PlantInfoViewModel(plant: $0) }
       // plantsWithTasks = AppData.myPlants.waterInLessThan3Days
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PlantInfoViewModel {
        taskCellsViewModels[indexPath.row]
    }
    
    func completeTask(at indexPath: IndexPath) {
        let plant = plantsWithTasks[indexPath.row]
        if let index = AppData.myPlants.firstIndex(where: { $0.id == plant.id }) {
            AppData.myPlants[index].lastWatering = Date()
        }
        plantsWithTasks.remove(at: indexPath.row)
        taskCellsViewModels.remove(at: indexPath.row)
    }


}
