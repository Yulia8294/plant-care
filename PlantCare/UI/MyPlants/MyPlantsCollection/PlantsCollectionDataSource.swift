//
//  PlantsCollectionDataSource.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

class PlantsCollectionDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var viewModel: MyPlantsViewModel!
    
    func setup(_ collection: UICollectionView, viewModel: MyPlantsViewModel) {
        self.viewModel = viewModel
        collection.delegate = self
        collection.dataSource = self
        collection.registerCell(PlantCell.self)
        collection.registerHeader(HeaderView.self)
        collection.setCollectionViewLayout(generateLayout(), animated: true)
    }
    
    //MARK: - Collection view delegate & datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.plantsCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.plantsCellViewModels[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.cell(PlantCell.self, for: indexPath)
            .setup(with: viewModel.getCellViewModel(at: indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionView.header(HeaderView.self, for: indexPath).setup(viewModel.getSectionHeaderTitle(for: indexPath.section))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectCell(at: indexPath)
    }
    
    //MARK: - Context menu
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureContextMenu(at: indexPath)
    }
    
    private func configureContextMenu(at indexPath: IndexPath) -> UIContextMenuConfiguration{
        
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off) { (_) in
                self.viewModel.deleteItem(at: indexPath)
            }
            
            return UIMenu(title: "", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [delete])
            
        }
        return context
    }
    
    
    
    //MARK: - CollectionViewLayout
    
    private func generateLayout() -> UICollectionViewLayout {
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
