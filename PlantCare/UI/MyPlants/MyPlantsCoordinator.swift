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
        myPlantsController.viewModel = MyPlantsViewModel(coordinator: self)
        navigationController.viewControllers = [myPlantsController]
    }
    
    func addPlant() {
        let coordinator = AddPlantCoordinator(nav: navigationController)
        coordinator.start()
    }
    
    func showPlantDetails(_ plant: Plant) {
        let vc = R.storyboard.myPlants.plantInfoController()!
        vc.viewModel = PlantInfoViewModel(coordinator: self, plant: plant)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
