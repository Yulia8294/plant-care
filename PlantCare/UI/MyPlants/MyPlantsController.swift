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
        plantsCollectionDataSource.setup(plantsCollection, viewModel: viewModel)
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.reload = { [weak self] in
            self?.plantsCollection.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPlants()
    }
    
    @IBAction func didPressAddPlantButton(_ sender: UIBarButtonItem) {
        viewModel.didPressAddNewPlant()
    }
}
