//
//  AddPlantCoordinator.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/25/22.
//

import UIKit

class AddPlantCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        navigationController = nav
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let vc = R.storyboard.addPlant.pickRoomController()!
        let masterViewModel = AddPlantInfoViewModel(coordinator: self)
        let roomsViewModel = RoomsViewModel(coordinator: self, viewModel: masterViewModel)
        vc.viewModel = roomsViewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPlantPictureScreen(viewModel: AddPlantInfoViewModel) {
        let vc = R.storyboard.addPlant.addPlantPictureController()!
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTitleScreen(viewModel: AddPlantInfoViewModel) {
        let vc = R.storyboard.addPlant.choosePlantTitleController()!
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showWateringCycleScreen(viewModel: AddPlantInfoViewModel) {
        let vc = R.storyboard.addPlant.setWateringCycleController()!
        vc.viewModel = ChooseWateringCycleViewModel(coordinator: self, viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func completePlantAdding() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
