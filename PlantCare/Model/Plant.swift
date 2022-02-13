//
//  Plant.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

struct Plant: Codable, Identifiable {
    
    var id: String
    var title: String
    var photo: ImageData
    var age: Int
    var dateAquired: Date
    var lastWatering: Date
    var wateringCycle: WateringCycle
    var room: Room

}

extension Plant {
    
    var nextWatering: Date {
        lastWatering.addingTimeInterval(60 * 60 * 24 * wateringCycle.daysPeriod)
    }
}

extension Array where Element == Plant {
    
    var waterInLessThan3Days: [Element] {
        self.filter { $0.nextWatering < Date().addingTimeInterval(-(60 * 60 * 24 * 3))}
    }
}

extension Plant: Hashable {
    
    static func == (lhs: Plant, rhs: Plant) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

