//
//  AppCoordinator.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        navigationController = nav
    }
    
    func start() {
        children = [
            MyPlantsCoordinator(nav: UINavigationController()),
            MyTasksCoordinator(nav: UINavigationController())
        ]
    }
    
    
}
