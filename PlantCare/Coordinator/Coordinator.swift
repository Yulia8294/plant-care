//
//  Coordinator.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
