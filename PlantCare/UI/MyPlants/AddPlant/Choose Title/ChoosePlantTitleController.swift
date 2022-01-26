//
//  ChoosePlantTitleController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/25/22.
//

import UIKit
import Combine

class ChoosePlantTitleController: UIViewController {
    
    @IBOutlet weak var plantNameTextField: UITextField!
    @IBOutlet weak var plantImageView: UIImageView!
    
    var viewModel: AddPlantInfoViewModel!
        
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.currentStep = .title
    }
    
    private func bindViewModel() {
        plantNameTextField.text = viewModel.name
        plantImageView.image = viewModel.capturedImage ?? viewModel.placeholderImage
        
        plantNameTextField.textPublisher
            .assign(to: \.name, on: viewModel)
            .store(in: &bindings)
    }
    
    @IBAction func didPressGeneratePlantNameButton(_ sender: UIButton) {
        plantNameTextField.text = "Random name"
    }
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        viewModel.stepCompleted()
    }
}

