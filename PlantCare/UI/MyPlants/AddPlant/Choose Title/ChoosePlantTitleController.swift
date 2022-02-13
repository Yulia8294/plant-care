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
    @IBOutlet weak var nameGenderPickerView: UIStackView!
    
    var viewModel: AddPlantInfoViewModel!
        
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        nameGenderPickerView.isHidden = true
        nameGenderPickerView.transform = .init(scaleX: 0.01, y: 0.01)
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
    
    @IBAction func didChooseMaleName(_ sender: UIButton) {
        setRandomName(StaticData.maleNames.randomElement())
    }
    
    @IBAction func didChooseFemaleName(_ sender: UIButton) {
        setRandomName(StaticData.femaleNames.randomElement())
    }
    
    @IBAction func didPressGeneratePlantNameButton(_ sender: UIButton) {
        if nameGenderPickerView.isHidden {
            animateAppearance(shouldShow: true)
        }
    }
    
    @IBAction func didPressNextButton(_ sender: UIButton) {
        viewModel.stepCompleted()
    }
    
    private func setRandomName(_ name: String?) {
        if let name = name {
            plantNameTextField.text = name
            viewModel.name = name
        }
        animateAppearance(shouldShow: false)
    }
    
    private func animateAppearance(shouldShow: Bool) {
        let scale: CGAffineTransform = shouldShow ? .identity : CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseIn) {
            if shouldShow {
                self.nameGenderPickerView.isHidden = false
            }
            self.nameGenderPickerView.transform = scale
        } completion: { _ in
            if !shouldShow {
                self.nameGenderPickerView.isHidden = true
            }
        }
    }
}

