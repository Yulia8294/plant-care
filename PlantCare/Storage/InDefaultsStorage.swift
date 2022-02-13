//
//  InDefaultsStorage.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import Foundation

class InDefaultsStorage {
    
    @InDefaults("my_plants", defaultValue: [])
    static var myPlants: [Plant]
    
}


