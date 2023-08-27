//
//  SummaryEquipment.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

struct SummaryEquipment {
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int
    let mrl: Int
    let drone: String
    let navalShip: String
    let antiAircraftWarfare: String
    let specialEquipment: String
    let mobileSRBMSystem: String
    let greatestLossesDirection: String
    var vehiclesAndFuelTanks: String
    let cruiseMissles: String
}

extension SummaryEquipment {
    init(from summaryEquipmentModel: SummaryEquipmentModel) {
        self.date = summaryEquipmentModel.date.changeDateFormat()
        self.day = summaryEquipmentModel.day
        self.aircraft = summaryEquipmentModel.aircraft
        self.helicopter = summaryEquipmentModel.helicopter
        self.tank = summaryEquipmentModel.tank
        self.apc = summaryEquipmentModel.apc
        self.fieldArtillery = summaryEquipmentModel.fieldArtillery
        self.mrl = summaryEquipmentModel.mrl
        
        switch summaryEquipmentModel.drone {
        case .number(let value):
            self.drone = "\(value)"
        case .none:
            self.drone = "None"
        }
        
        switch summaryEquipmentModel.navalShip {
        case .number(let value):
            self.navalShip = "\(value)"
        case .none:
            self.navalShip = "None"
        }
        
        switch summaryEquipmentModel.antiAircraftWarfare {
        case .number(let value):
            self.antiAircraftWarfare = "\(value)"
        case .none:
            self.antiAircraftWarfare = "None"
        }
        
        switch summaryEquipmentModel.specialEquipment {
        case .number(let value):
            self.specialEquipment = "\(value)"
        case .none:
            self.specialEquipment = "None"
        }
        
        switch summaryEquipmentModel.mobileSRBMSystem {
        case .number(let value):
            self.mobileSRBMSystem = "\(value)"
        case .none:
            self.mobileSRBMSystem = "None"
        }
        
        switch summaryEquipmentModel.greatestLossesDirection {
        case .direction(let value):
            self.greatestLossesDirection = value
        case .none:
            self.greatestLossesDirection = "None"
        }
        
        self.vehiclesAndFuelTanks = "\(summaryEquipmentModel.vehiclesAndFuelTanks)"
        
        switch summaryEquipmentModel.cruiseMissles {
        case .number(let value):
            self.cruiseMissles = "\(value)"
        case .none:
            self.cruiseMissles = "None"
        }
    }
}
