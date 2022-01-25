//
//  UIView+Animation.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit

private let animationScale : CGFloat = 0.8

extension UIView {
    
    typealias AnimationCompletion = (Bool) -> Void
    
    func animateClick() {
        animatePressDown(scale: 0.92) { _ in
            self.animatePressUp()
        }
    }
    
    func animatePressDown(scale: CGFloat = animationScale, completion: AnimationCompletion? = nil) {
        animate(transform: CGAffineTransform.identity.scaledBy(x: scale, y: scale), completion: completion)
    }
    
    func animatePressUp(completion: AnimationCompletion? = nil) {
        animate(transform: .identity, completion: completion)
    }
    
    func animate(transform: CGAffineTransform, completion: AnimationCompletion?) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 3,
                       options: .allowUserInteraction,
                       animations: {
                       self.transform = transform
        }, completion: completion)
    }
}
