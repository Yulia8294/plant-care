//
//  MyPlantsCoordinator.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit

class MyPlantsCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        navigationController = nav
        navigationController.navigationBar.prefersLargeTitles = true
        start()
    }
    
    func start() {
        let myPlantsController = R.storyboard.myPlants.myPlantsController()!
        let myPlantsViewModel = MyPlantsViewModel()
        myPlantsViewModel.coordinator = self
        myPlantsController.viewModel = myPlantsViewModel
        navigationController.viewControllers = [myPlantsController]
    }
    
    func addPlant() {
        let coordinator = AddPlantCoordinator(nav: navigationController)
        coordinator.start()
    }
    
}
