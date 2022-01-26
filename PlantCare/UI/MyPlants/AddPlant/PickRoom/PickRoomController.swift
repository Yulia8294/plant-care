//
//  PickRoomController.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit

class PickRoomController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: RoomsViewModel!
    
    func initWithModel() {
        viewModel.reload = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.getRooms()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerCell(PickRoomCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        initWithModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.roomsListWillAppear()
    }
}


extension PickRoomController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.roomsCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.cell(PickRoomCell.self, for: indexPath)
            .setup(with: viewModel.getCellViewModel(at: indexPath))
    }
}

extension PickRoomController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let interitemSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - collectionView.contentInset.left * 2 - PickRoomController.interitemSpacing * 2) / 3
        let height = width * 1.3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        PickRoomController.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectCell(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        (collectionView.cellForItem(at: indexPath) as? PickRoomCell)?.onHighlighted(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        (collectionView.cellForItem(at: indexPath) as? PickRoomCell)?.onHighlighted(false)
    }
}
