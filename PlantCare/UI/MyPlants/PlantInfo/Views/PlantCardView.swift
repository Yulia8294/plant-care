//
//  PlantCardView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import UIKit

@IBDesignable
class PlantCardView: UIView, ShadowableRoundableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cornerRadius = 10
    }
    
    @IBInspectable var shadowColor: UIColor = .darkGray {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffsetWidth: CGFloat = 0.5 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    
    @IBInspectable var shadowOffsetHeight: CGFloat = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    
    @IBInspectable var shadowOpacity: Float = 0.4 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat = 4 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    private(set) lazy var shadowLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 0)
        self.setNeedsLayout()
        return layer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadiusAndShadow()
    }
}
