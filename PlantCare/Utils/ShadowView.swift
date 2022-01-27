//
//  ShadowView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

struct CustomShadow {
    var color: UIColor = .black
    var alpha: Float = 0.5
    var width: CGFloat = 0
    var height: CGFloat = 2
    var radius: CGFloat = 4
    var spread: CGFloat = 0
}

@IBDesignable
class ShadowView: UIView {
    
    var shadow: CustomShadow = CustomShadow(color: #colorLiteral(red: 0.5019607843, green: 0.5254901961, blue: 0.5843137255, alpha: 0.12), alpha: 1, width: 0, height: 1, radius: 4, spread: 0)
    
    var viewCornerRadius: CGFloat = 8
    
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    func setupShadow() {
        backgroundColor = backgroundColor ?? .white
        layer.cornerRadius = viewCornerRadius
        layer.applyShadow(shadow)
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

protocol ShadowableRoundableView {
    
    var cornerRadius: CGFloat { get set }
    var shadowColor: UIColor { get set }
    var shadowOffsetWidth: CGFloat { get set }
    var shadowOffsetHeight: CGFloat { get set }
    var shadowOpacity: Float { get set }
    var shadowRadius: CGFloat { get set }
    
    var shadowLayer: CAShapeLayer { get }
    
    func setCornerRadiusAndShadow()
}

extension ShadowableRoundableView where Self: UIView {
    
    func setCornerRadiusAndShadow() {
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius
        shadowLayer.path = UIBezierPath(roundedRect: bounds,
                                            cornerRadius: cornerRadius ).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth ,
                                          height: shadowOffsetHeight )
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
    }
}
