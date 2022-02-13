//
//  MyTasksCoordinator.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import UIKit

class MyTasksCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        navigationController = nav
        navigationController.navigationBar.prefersLargeTitles = true
        start()
    }
    
    func start() {
        let myTasksController = R.storyboard.myTasks.myTasksController()!
        let myTasksViewModel = MyTasksViewModel(coordinator: self)
        myTasksController.viewModel = myTasksViewModel
        navigationController.viewControllers = [myTasksController]
    }
    
    
}
