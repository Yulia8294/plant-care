//
//  TaskCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 2/13/22.
//

import UIKit
import SwiftUI
import Combine
import Constraint

class TaskCell: UITableViewCell {

    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var plantRoomLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var wateringMessage: UILabel!
    
    private var progressModel = ProgressViewModel(color: .orange, strokeWidth: 4, progress: 0)
    private var subscriptions = Set<AnyCancellable>()
    private var model: PlantInfoViewModel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        let hosting = UIHostingController(rootView: CircleProgressBar(progressModel: progressModel))
        progressView.addSubview(hosting.view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        hosting.view.leadingAnchor.constraint(equalTo: progressView.leadingAnchor).isActive = true
        hosting.view.trailingAnchor.constraint(equalTo: progressView.trailingAnchor).isActive = true
        hosting.view.topAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        hosting.view.bottomAnchor.constraint(equalTo: progressView.bottomAnchor).isActive = true

    }
    
    @discardableResult
    func setup(with model: PlantInfoViewModel) -> Self {
        self.model = model
        
        subscriptions = [
            model.$name.assign(to: \.text!, on: plantNameLabel),
            model.$roomTitle.assign(to: \.text!, on: plantRoomLabel),
            model.$photo.assign(to: \.image, on: plantImageView),
            model.nextWateringString.assign(to: \.text!, on: wateringMessage),
            model.nextWateringFractionCompleted.assign(to: \.progress, on: progressModel)
        ]
        
        return self
    }
}
