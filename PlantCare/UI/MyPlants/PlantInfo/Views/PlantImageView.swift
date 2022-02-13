//
//  PlantImageView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import UIKit

@IBDesignable
class PlantImageView: UIImageView {
    
    func pathCurvedForView(givenView: UIView, curvedPercent:CGFloat) -> UIBezierPath {
        
        let bottomY = givenView.bounds.size.height - (givenView.bounds.size.height*curvedPercent)
        let controlPoint = CGPoint(x:givenView.bounds.size.width/2, y:givenView.bounds.size.height)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x:0, y:0))
        path.addLine(to: CGPoint(x: givenView.bounds.size.width, y:0))
        path.addLine(to: CGPoint(x: givenView.bounds.size.width, y: bottomY))
        path.addQuadCurve(to: CGPoint(x:0, y: bottomY), controlPoint: controlPoint)
        path.addLine(to: CGPoint(x:0, y:0))
        path.close()
        
//        print("width \(givenView.bounds.size.width)")
//        print("height \(givenView.bounds.size.height)")
//
//        print("Bottom right point \(CGPoint(x: givenView.bounds.size.width, y: bottomY))")
//        print("Bottom left point \(CGPoint(x:0, y: bottomY))")
//        print("Control point \(controlPoint)")

        return path
    }
    
    @IBInspectable var curvedPercent : CGFloat = 0 {
        didSet {
            guard curvedPercent <= 1 && curvedPercent >= 0 else {
                return
            }
            
            setLayer()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayer()
    }
    
    private func setLayer() {
        let shapeLayer = CAShapeLayer(layer: self.layer)
        shapeLayer.path = self.pathCurvedForView(givenView: self, curvedPercent: curvedPercent).cgPath
        shapeLayer.frame = self.bounds
        shapeLayer.masksToBounds = true
        self.layer.mask = shapeLayer
    }

}
