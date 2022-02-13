//
//  DefaultPlantPicturesController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/28/22.
//

import UIKit

class DefaultPlantPicturesController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: DefaultPlantsImagesCollectionDataSource!
    var viewModel: AddPlantInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = DefaultPlantsImagesCollectionDataSource(collectionView: collectionView, viewModel: viewModel)
    }
}

extension UIImage {
  func withBackground(color: UIColor, opaque: Bool = false) -> UIImage {
    UIGraphicsBeginImageContext(size)
        
    guard let ctx = UIGraphicsGetCurrentContext(), let image = cgImage else { return self }
    defer { UIGraphicsEndImageContext() }

    let rect = CGRect(origin: .zero, size: size)
    ctx.setFillColor(UIColor.accent.withAlphaComponent(0.2).cgColor)
    ctx.fill(rect)
    ctx.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height))
    ctx.draw(image, in: rect)
    
    return UIGraphicsGetImageFromCurrentImageContext() ?? self
  }
}
