//
//  Storage.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import Foundation

class AppData {
    
    static var myPlants = [Plant]() {
        didSet {
            InDefaultsStorage.myPlants = myPlants
        }
    }
    
    static func loadFromCache() {
        myPlants = InDefaultsStorage.myPlants
    }
    
}
