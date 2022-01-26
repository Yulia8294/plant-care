//
//  WateringCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

class WateringCell: UITableViewCell {

    @IBOutlet weak var wateringLabel: UILabel!
    
    @discardableResult
    func setup(with cycle: WateringCycle) -> Self {
        wateringLabel.text = text(for: cycle)
        return self
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
