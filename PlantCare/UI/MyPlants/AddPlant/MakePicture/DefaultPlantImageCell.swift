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
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.cornerRadius = bounds.height / 2
    }
}
