//
//  PlantInfoController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class PlantInfoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
}
