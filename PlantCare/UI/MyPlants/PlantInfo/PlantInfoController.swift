//
//  PlantInfoController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class PlantInfoController: UIViewController {
    
    @IBOutlet weak var plantInfoView: PlantInfoView!
    
    var viewModel: PlantInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAppearance()
        plantInfoView.setup(with: viewModel.plantViewModel)
    }
    
    private func setupNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
}
