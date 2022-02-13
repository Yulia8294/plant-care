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

struct ImageData: Codable {
    let imageData: Data?
    
    init(withImage image: UIImage) {
        self.imageData = image.jpegData(compressionQuality: 0.3)
    }

    func getImage() -> UIImage? {
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)
        
        return image
    }
}
