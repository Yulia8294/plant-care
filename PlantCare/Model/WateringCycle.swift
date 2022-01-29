//
//  WateringCycle.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/25/22.
//

import Foundation

enum WateringCycle: CaseIterable, Codable {
    case weekly
    case daily
    case biweekly
    case monthly
    //case custom(Int)
    
    var daysPeriod: TimeInterval {
        switch self {
        case .weekly:
            return 7
        case .daily:
            return 1
        case .biweekly:
            return 14
        case .monthly:
            return 30
        }
    }
}
