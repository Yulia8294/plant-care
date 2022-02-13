//
//  PlantInfoView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit
import SwiftUI
import Combine

class PlantInfoView: XibView {
    
    @IBOutlet weak var plantImageView: PlantImageView!
    @IBOutlet weak var wateringCard: PlantCardView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var lastWateringLabel: UILabel!
    @IBOutlet weak var nextWateringLabel: UILabel!
    @IBOutlet weak var wateringDescriptionLabel: UILabel!
    
    private var subscriptions = Set<AnyCancellable>()
    private var model: PlantInfoViewModel!
    private var progressModel = ProgressViewModel()

    override func setup() {
        super.setup()
    }
    
    
    @discardableResult
    func setup(with model: PlantInfoViewModel) -> Self {
        self.model = model
        
        subscriptions = [
            model.$name.assign(to: \.text!, on: titleLabel),
            model.$roomTitle.assign(to: \.text!, on: roomLabel),
            model.$photo.assign(to: \.image, on: plantImageView),
            model.lastWateringString.assign(to: \.text!, on: lastWateringLabel),
            model.nextWateringString.assign(to: \.text!, on: nextWateringLabel),
            model.wateringCycleDescription.assign(to: \.text!, on: wateringDescriptionLabel),
            model.nextWateringFractionCompleted.assign(to: \.progress, on: progressModel)
        ]
        
        setupProgressView(for: model)
        return self
    }
    
    private func setupProgressView(for model: PlantInfoViewModel) {
        let progressCircle = CircleProgressBar(progressModel: progressModel)
        let hosting = UIHostingController(rootView: progressCircle)
        progressView.addSubview(hosting.view)
        hosting.view.frame = progressView.bounds
    }
    
    @IBAction func didPressWaterPlant(_ sender: UIButton) {
        model.didPressWaterPlant()
    }
}

class ProgressViewModel: ObservableObject {
    
    @Published var color: UIColor = .accent
    @Published var strokeWidth: CGFloat = 15
    @Published var progress: Float = 0 {
        didSet {
            print("progress \(progress)")
        }
    }
    
    init() {
        
    }
    
    init(color: UIColor, strokeWidth: CGFloat, progress: Float) {
        self.color = color
        self.strokeWidth = strokeWidth
        self.progress = progress
    }
}
