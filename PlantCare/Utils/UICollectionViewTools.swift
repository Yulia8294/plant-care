//
//  UICollectionViewTools.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T>(_ type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: nil)
        register(nib, forCellWithReuseIdentifier: String(describing: type))
    }
    
    func cell<T>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! T
    }
    
    func registerHeader<T>(_ type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: type))
    }
       
    func header<T>(_ type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: type), for: indexPath) as! T
    }
    
    func header<T>(_ type: T.Type, id: String, for indexPath: IndexPath) -> T {
        dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: id, for: indexPath) as! T
    }
    
    var contentHeight: CGFloat {
        collectionViewLayout.collectionViewContentSize.height
    }
    
    var contentWidth: CGFloat {
        collectionViewLayout.collectionViewContentSize.width
    }
    
    func reload() {
        UIView.performWithoutAnimation {
            self.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func setBottomInset(_ needInset: Bool, _ value: CGFloat = 100) {
        if needInset {
            UIView.animate(withDuration: 0.3) {
                let inset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
                self.contentInset = inset
                self.scrollIndicatorInsets = inset
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.contentInset = .zero
                self.scrollIndicatorInsets = .zero
            }
        }
    }
}
