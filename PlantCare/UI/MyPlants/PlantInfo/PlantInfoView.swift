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
    
    override func setup() {
        super.setup()
        setupProgressView()
    }
    
    private func setupProgressView() {
        let progressCircle = CircleProgressBar(progress: .constant(0.5))
        let hosting = UIHostingController(rootView: progressCircle)
        progressView.addSubview(hosting.view)
        hosting.view.frame = progressView.bounds
    }
}
