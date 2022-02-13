//
//  ImageData.swift
//  PlantCare
//
//  Created by Yulia Novikova on 2/13/22.
//

import UIKit

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
