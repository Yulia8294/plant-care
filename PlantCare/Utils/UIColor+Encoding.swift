//
//  UIColor+Encoding.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import UIKit

extension UIColor {
    
    class func color(data: Data) -> UIColor? {
        try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
    }
    
    func encode() -> Data? {
        try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
    }
}
