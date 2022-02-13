//
//  HeaderView.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    func setup(_ title: String) -> Self {
        sectionTitle.text = title
        return self
    }
}

