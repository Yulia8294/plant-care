//
//  WateringCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

class WateringCell: UITableViewCell {

    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var wateringLabel: UILabel!
    
    @discardableResult
    func setup(with cycle: WateringCycle) -> Self {
        wateringLabel.text = text(for: cycle)
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.shadow = CustomShadow(color: #colorLiteral(red: 0.5019607843, green: 0.5254901961, blue: 0.5843137255, alpha: 0.26), alpha: 1, width: 0, height: 1, radius: 4, spread: 0)
        shadowView.viewCornerRadius = 10
    }
    
    private func text(for cycle: WateringCycle) -> String {
        switch cycle {
        case .weekly:
            return "Once a week"
        case .daily:
            return "Once a day"
        case .biweekly:
            return "Once in two weeks"
        case .monthly:
            return "Once a month"
//        case .custom(let days):
//            return "Once in \(days) days"
        }
    }

}
