//
//  RoomsViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import Foundation
import UIKit

struct Room: Codable, Identifiable {
    
    let image: ImageData
    let title: String
    let id: Int
    
    static var defaultRooms: [Room] = [
        Room(image: ImageData(withImage: R.image.office()!), title: "Office", id: 1),
        Room(image: ImageData(withImage: R.image.kitchen()!), title: "Kitchen", id: 2),
        Room(image: ImageData(withImage: R.image.bathroom()!), title: "Bathroom", id: 3),
        Room(image: ImageData(withImage: R.image.livingroom()!), title: "Living Room", id: 4),
        Room(image: ImageData(withImage: R.image.bedroom()!), title: "Bedroom", id: 5),
        Room(image: ImageData(withImage: R.image.terrace()!), title: "Terrace", id: 6)
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
        return PickRoomCellViewModel(image: room.image.getImage(),
                                     title: room.title)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PickRoomCellViewModel {
        roomsCellViewModels[indexPath.row]
    }
}
