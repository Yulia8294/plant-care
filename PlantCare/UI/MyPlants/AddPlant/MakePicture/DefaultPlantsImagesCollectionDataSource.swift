//
//  DefaultPlantsImagesCollectionDataSource.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/28/22.
//

import UIKit

class DefaultPlantsImagesCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView
    private let viewModel: AddPlantInfoViewModel

    private let cellId = "defaultPlantImageCell"
    
    var defaultPictures: [UIImage] = [
        R.image.default1()!,
        R.image.default2()!,
        R.image.default3()!,
        R.image.default4()!,
        R.image.default5()!,
        R.image.default6()!,
        R.image.default7()!,
        R.image.default8()!,
        R.image.default9()!,
        R.image.default10()!,
        R.image.default11()!,
        R.image.default12()!,
        R.image.default13()!,
        R.image.default14()!,
        R.image.default15()!,
        R.image.default16()!,
        R.image.default17()!,
        R.image.default18()!
    ]
    
    init(collectionView: UICollectionView, viewModel: AddPlantInfoViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        defaultPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DefaultPlantImageCell
        cell.imageView.image = defaultPictures[indexPath.item].withBackground(color: .clear)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.capturedImage = defaultPictures[indexPath.item].withBackground(color: .clear)
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1 / 3
        let inset: CGFloat = 3

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
