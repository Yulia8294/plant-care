//
//  MainTabBarController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let main = AppCoordinator(nav: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        viewControllers = main.children.map { $0.navigationController }
    }
}
