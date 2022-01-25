//
//  MyPlantsViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class MyPlantsViewModel: NSObject {
    
    var coordinator: MyPlantsCoordinator!
    
    func didPressAddNewPlant() {
        coordinator.addNewPlant()
    }
}
