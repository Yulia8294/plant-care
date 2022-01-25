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
    
    func addNewPlant() {
        let viewController = R.storyboard.addPlant.pickRoomController()!
        let viewModel = RoomsViewModel(coordinator: self)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func addPlant(for room: Room) {
        let vc = R.storyboard.addPlant.addPlantPictureController()!
        vc.viewModel = CapturePlantViewModel(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
