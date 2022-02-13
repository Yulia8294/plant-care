//
//  PlantInfoViewModel.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/27/22.
//

import Combine
import UIKit

class PlantInfoViewModel {
    
    @Published var name: String = ""
    @Published var photo: UIImage?
    @Published var lastWatering = Date()
    @Published var wateringCycle: WateringCycle = .daily
    @Published var roomTitle: String = ""
    
    private var id: String {
        plant.id
    }
    
    lazy var wateringCycleDescription: AnyPublisher<String, Never> = {
        $wateringCycle
            .map { self.message(for: $0) }
            .eraseToAnyPublisher()
    }()
    
    lazy var lastWateringString: AnyPublisher<String, Never> = {
        $lastWatering
            .map { "Last watering: " + $0.timeAgoDisplay() }
            .eraseToAnyPublisher()
    }()
    
    lazy var nextWateringString: AnyPublisher<String, Never> = {
        $lastWatering.combineLatest($wateringCycle)
            .map { self.nextWateringString(lastWatering: $0, cycle: $1) }
            .eraseToAnyPublisher()
    }()
    
    lazy var nextWateringFractionCompleted: AnyPublisher<Float, Never> = {
        $lastWatering.combineLatest($wateringCycle)
            .map { self.fractionCompleted(last: $0, cycle: $1) }
            .eraseToAnyPublisher()
    }()
    
    private var plant: Plant
    private let coordinator: MyPlantsCoordinator?
        
    init(coordinator: MyPlantsCoordinator? = nil, plant: Plant) {
        self.coordinator = coordinator
        self.plant = plant
        self.configureOutput()
    }
    
    private func configureOutput() {
        name = plant.title
        photo = plant.photo.getImage() ?? R.image.plantPlaceholder()!
        lastWatering = plant.lastWatering
        wateringCycle = plant.wateringCycle
        roomTitle = plant.room.title
    }
    
    func didPressWaterPlant() {
        lastWatering = Date()
        if let index = AppData.myPlants.firstIndex(where: { $0.id == plant.id }) {
            AppData.myPlants[index].lastWatering = lastWatering
        }
    }
}

extension PlantInfoViewModel: Hashable {
    static func == (lhs: PlantInfoViewModel, rhs: PlantInfoViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//MARK: - Dates handling

extension PlantInfoViewModel {
    
    private func fractionCompleted(last: Date, cycle: WateringCycle) -> Float {
        let next = nextWateringDate(from: last, cycle: cycle)
        let now = Date()
        let diff = daysDiffBetween(now, and: next)
        
        if Date() < next {
            if diff == 0 { return 0 }
            let overall = Float(cycle.daysPeriod)
            let passed = overall - Float(diff)
            return passed / overall
        } else {
            return 1
        }
    }
    
    private func nextWateringDate(from lastWatering: Date, cycle: WateringCycle) -> Date {
        lastWatering.addingTimeInterval(60 * 60 * 24 * cycle.daysPeriod)
    }
    
    private func nextWateringString(lastWatering: Date, cycle: WateringCycle) -> String {
        let nextWatering = nextWateringDate(from: lastWatering, cycle: cycle)
        
        if self.shouldWaterToday(nextWatering) {
            return "Water today"
        }
        
        if self.shouldWaterTomorrow(nextWatering) {
            return "Water tomorrow"
        }
        
        let now = Date()
        let diff = daysDiffBetween(now, and: nextWatering)
        
        if now < nextWatering {
            return "Water in \(diff) days"
        } else {
            return "Missed watering for \(abs(diff)) days"
        }
    }
    
    
    
    //MARK: - Helpers
    
    private func daysDiffBetween(_ lastWatering: Date, and nextWatering: Date) -> Int {
        let diff = Calendar.current.numberOfDaysBetween(lastWatering, and: nextWatering)
        
        if diff == 0 {
            return shouldWaterTomorrow(nextWatering) ? 1 : 0
        }
        return diff
    }
    
    private func shouldWaterToday(_ wateringDateTarget: Date) -> Bool {
        Calendar.current.isDateInToday(wateringDateTarget)
    }
    
    private func shouldWaterTomorrow(_ wateringDateTarget: Date) -> Bool {
        Calendar.current.isDateInTomorrow(wateringDateTarget)
    }
    
    private func message(for wateringCycle: WateringCycle) -> String {
        switch wateringCycle {
        case .weekly:
            return "Watering required once a week"
        case .daily:
            return "Watering required once a day"
        case .biweekly:
            return "Watering required once in 2 weeks"
        case .monthly:
            return "Watering required once a month"
        }
    }
}


