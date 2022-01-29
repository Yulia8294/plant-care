//
//  DefaultPlantImageCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/28/22.
//

import UIKit

class DefaultPlantImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "defaultPlantImageCell"

    override var isSelected: Bool {
        didSet {
            animateSelectionState()
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  addGradientLayer()
    }
    
    private(set) lazy var shadowLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 0)
        self.setNeedsLayout()
        return layer
    }()
    
    private func addGradientLayer() {
       
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.accent.cgColor
        shadowLayer.shadowOffset = CGSize(width: 1,
                                          height: 1)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 1
        shadowLayer.isHidden = !self.isSelected
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.cornerRadius = bounds.height / 2
    //    updateLayersPath()
    }
    
    private func updateLayersPath() {
        shadowLayer.path = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: imageView.cornerRadius).cgPath
        shadowLayer.shadowPath = shadowLayer.path
    }
    
    private func animateSelectionState() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            let transform: CGAffineTransform = self.isSelected ? .init(scaleX: 0.8, y: 0.8) : .identity
            self.shadowLayer.isHidden = !self.isSelected
            self.imageView.transform = transform
        } completion: { _ in
            
        }
    }
    
}
