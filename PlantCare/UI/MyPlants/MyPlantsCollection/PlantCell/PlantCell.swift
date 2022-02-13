//
//  PlantCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class PlantCell: UICollectionViewCell {

    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var gradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    @discardableResult
    func setup(with viewModel: PlantCellViewModel) -> Self {
        plantImage.image = viewModel.image
        plantNameLabel.text = viewModel.title
        return self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.frame = bounds
    }

}
