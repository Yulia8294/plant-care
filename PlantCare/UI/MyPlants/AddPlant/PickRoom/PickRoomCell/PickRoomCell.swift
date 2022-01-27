//
//  PickRoomCell.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit
import Constraint

class PickRoomCell: UICollectionViewCell {
    
    @IBOutlet weak var roomTitle: UILabel!
    @IBOutlet weak var roomImageView: UIImageView!
    
    private let pressDownScale: CGFloat = 0.9
    
    @discardableResult
    func setup(with viewModel: PickRoomCellViewModel) -> Self {
        roomImageView.image = viewModel.image
        roomTitle.text = viewModel.title
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roomImageView.layer.cornerRadius = 10
        roomImageView.layer.masksToBounds = true
    }
    
    func onHighlighted(_ highlighted: Bool) {
        DispatchQueue.main.async {
            highlighted ? self.roomImageView.animatePressDown(scale: self.pressDownScale) : self.roomImageView.animatePressUp()
        }
    }
}
