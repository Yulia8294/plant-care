//
//  CALayer+Shadows.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

extension CALayer {
    
    func applyShadow(_ shadow: CustomShadow) {
        
        shadowColor = shadow.color.cgColor
        shadowOpacity = shadow.alpha
        shadowOffset = CGSize(width: shadow.width, height: shadow.height)
        shadowRadius = shadow.radius
        if shadow.spread == 0 {
            shadowPath = nil
        } else {
            let dx = -shadow.spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect,
                                      byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        }
    }
}
