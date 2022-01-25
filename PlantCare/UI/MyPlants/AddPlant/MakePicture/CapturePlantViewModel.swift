//
//  CapturePlantViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit
import Combine

class CapturePlantViewModel: NSObject {
        
    let coordinator: MyPlantsCoordinator
    
    @Published private(set) var capturedImage: UIImage?
    
    init(coordinator: MyPlantsCoordinator) {
        self.coordinator = coordinator
    }
    
    func didPickImage(_ image: UIImage) {
        capturedImage = image
    }
}
