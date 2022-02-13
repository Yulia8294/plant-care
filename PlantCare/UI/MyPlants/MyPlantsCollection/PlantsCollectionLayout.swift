//
//  PlantsCollectionLayout.swift
//  PlantCare
//
//  Created by Yulia Novikova on 2/13/22.
//

import UIKit

struct PlantsCollectionLayout {
    
    static func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let plantItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(190))

        let plantGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: plantItem, count: 2)
        plantGroup.interItemSpacing = .fixed(10)
        let sideInsets: CGFloat = 16
        
        let section = NSCollectionLayoutSection(group: plantGroup)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: sideInsets, bottom: 10, trailing: sideInsets)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(25)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
