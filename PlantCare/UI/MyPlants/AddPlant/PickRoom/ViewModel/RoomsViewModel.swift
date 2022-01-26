//
//  RoomsViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import UIKit

struct Room {
    let image: UIImage
    let title: String
    
    static var defaultRooms: [Room] = [
        Room(image: R.image.office()!, title: "Office"),
        Room(image: R.image.kitchen()!, title: "Kitchen"),
        Room(image: R.image.bathroom()!, title: "Bathroom"),
        Room(image: R.image.livingroom()!, title: "Living Room"),
        Room(image: R.image.bedroom()!, title: "Bedroom"),
        Room(image: R.image.terrace()!, title: "Terrace")
    ]
}

class RoomsViewModel: NSObject {
    
    let coordinator: AddPlantCoordinator
    let viewModel: AddPlantInfoViewModel
    
    init(coordinator: AddPlantCoordinator, viewModel: AddPlantInfoViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
    }
    
    var rooms = [Room]()
    
    var reload: (() -> Void)?
    
    var roomsCellViewModels = [PickRoomCellViewModel]() {
        didSet {
            reload?()
        }
    }
    
    func roomsListWillAppear() {
        viewModel.currentStep = .room
    }
        
    func didSelectCell(at indexPath: IndexPath) {
        viewModel.room = rooms[indexPath.row]
        viewModel.stepCompleted()
    }
    
    func getRooms() {
        rooms = Room.defaultRooms
        roomsCellViewModels = rooms.map { createCellModel(room: $0) }
    }
    
    func createCellModel(room: Room) -> PickRoomCellViewModel {
        return PickRoomCellViewModel(image: room.image, title: room.title)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PickRoomCellViewModel {
        roomsCellViewModels[indexPath.row]
    }
}
