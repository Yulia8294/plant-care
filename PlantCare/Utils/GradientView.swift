//
//  GradientView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class GradientView: UIView {
    
    private var gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.6).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
