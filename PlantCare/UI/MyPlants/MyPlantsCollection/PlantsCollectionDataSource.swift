//
//  PlantsCollectionDataSource.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class PlantsCollectionDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setup(_ collection: UICollectionView) {
        collection.delegate = self
        collection.dataSource = self
        collection.registerCell(PlantCell.self)
        collection.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    //MARK: - Collection view delegate & datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.cell(PlantCell.self, for: indexPath)
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
////        return collectionView.header(TripletSectionHeader.self, for: indexPath).setup(for: section,
////                                                                                         canExpand: canExpand(section),
////                                                                                         state: displayState(for: section),
////                                                                                         delegate: self)
//    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let plantItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(220))

        let plantGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: plantItem, count: 2)
        plantGroup.interItemSpacing = .fixed(10)
        let sideInsets: CGFloat = 16
        
        let section = NSCollectionLayoutSection(group: plantGroup)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: sideInsets, bottom: 10, trailing: sideInsets)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(35)
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
