//
//  PlantDetailViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/29/22.
//

import UIKit

struct PlantDetailViewModel {
    
    var name: String
    var photo: UIImage?
    var lastWatering: Date
    var wateringCycle: WateringCycle
    var roomTitle: String
}

//MARK: - Dates handling

extension PlantDetailViewModel {
    
    var lastWateringString: String {
        lastWatering.timeAgoDisplay()
    }
    
    var nextWateringFractionCompleted: Float {
        if Date() < dateToWaterFromLastWatering {
            if differenceInLastAndNextWateringInDays == 0 { return 0 }
            let overall = Float(wateringCycle.daysPeriod)
            let passed = overall - Float(differenceInLastAndNextWateringInDays)
            return passed / overall
        } else {
            return 1
        }
    }
    
    var dateToWaterFromLastWatering: Date {
        lastWatering.addingTimeInterval(60 * 60 * 24 * wateringCycle.daysPeriod)
    }
    
    var differenceInLastAndNextWateringInDays: Int {
        let diff = Calendar(identifier: .gregorian).numberOfDaysBetween(lastWatering, and: dateToWaterFromLastWatering)
        if diff == 0 {
            return shouldWaterTomorrow ? 1 : 0
        }
        return diff
    }
    
    var nextWatering: String {
        if shouldWaterToday {
            return "Water today"
        }
        
        if shouldWaterTomorrow {
            return "Water tomorrow"
        }
        
        if Date() < dateToWaterFromLastWatering {
            return "Water in \(differenceInLastAndNextWateringInDays) days"
        } else {
            return "Missed watering for \(differenceInLastAndNextWateringInDays) days"
        }
    }
    
    var shouldWaterToday: Bool {
        Calendar.current.isDateInToday(dateToWaterFromLastWatering)
    }
    
    var shouldWaterTomorrow: Bool {
        Calendar.current.isDateInTomorrow(dateToWaterFromLastWatering)
    }
    
    var wateringCycleMessage: String {
        switch wateringCycle {
        case .weekly:
            return "Watering required once a week"
        case .daily:
            return "Watering required once a day"
        case .biweekly:
            return "Watering required once in 2 weeks"
        case .monthly:
            return "Watering required once a month"
        }
    }
}

