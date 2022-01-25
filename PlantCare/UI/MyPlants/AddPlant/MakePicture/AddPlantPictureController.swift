//
//  AddPlantPictureController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit
import PhotosUI
import Combine

class AddPlantPictureController: UIViewController {
        
    @IBOutlet weak var plantImage: UIImageView!
    
    var viewModel: CapturePlantViewModel!
    
    private let placeholderImage = R.image._PlantImage()!
    private let mediaPicker = MediaPicker()
    
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.$capturedImage
            .receive(on: RunLoop.main)
            .sink { [weak self] image in
                self?.plantImage.image = image ?? self?.placeholderImage
            }
            .store(in: &bindings)
    }
    
    @IBAction func didPressUseDefaultButton(_ sender: UIButton) {
        viewModel.didPickImage(R.image._PlantImage()!)
    }
    
    @IBAction func didPressTakePicutreButton(_ sender: UIButton) {
        mediaPicker.showPhotoMenu(presentingController: self, sender: sender) { [weak self] image in
            self?.viewModel.didPickImage(image)
        }
    }
}
