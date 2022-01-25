//
//  UIView+Storyboard.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit

public extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set { clipsToBounds = true; layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { if let color = layer.borderColor { return UIColor(cgColor: color) }
                return .clear
            }
    }
}

