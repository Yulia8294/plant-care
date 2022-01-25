//
//  MyPlantsController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class MyPlantsController: UIViewController {
    
    @IBOutlet weak var plantsCollection: UICollectionView!
    
    private let plantsCollectionDataSource = PlantsCollectionDataSource()
    
    var viewModel: MyPlantsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plantsCollectionDataSource.setup(plantsCollection)
    }
    
    @IBAction func didPressAddPlantButton(_ sender: UIBarButtonItem) {
        viewModel.didPressAddNewPlant()
    }
}
