//
//  PlantInfoView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit
import SwiftUI

class PlantInfoView: XibView {
    
    @IBOutlet weak var plantImageView: PlantImageView!
    @IBOutlet weak var wateringCard: PlantCardView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var lastWateringLabel: UILabel!
    @IBOutlet weak var nextWateringLabel: UILabel!
    @IBOutlet weak var wateringDescriptionLabel: UILabel!
    
    override func setup() {
        super.setup()
    }
    
    @discardableResult
    func setup(with model: PlantDetailViewModel) -> Self {
        plantImageView.image = model.photo ?? R.image.plantPlaceholder()!
        roomLabel.text = model.roomTitle
        titleLabel.text = model.name
        lastWateringLabel.text = "Last watering: " + model.lastWateringString
        nextWateringLabel.text = model.nextWatering
        wateringDescriptionLabel.text = model.wateringCycleMessage
        setupProgressView(for: model.nextWateringFractionCompleted)
        return self
    }
    
    private func setupProgressView(for progress: Float) {
        let progressCircle = CircleProgressBar(progress: .constant(progress))
        let hosting = UIHostingController(rootView: progressCircle)
        progressView.addSubview(hosting.view)
        hosting.view.frame = progressView.bounds
    }
}
