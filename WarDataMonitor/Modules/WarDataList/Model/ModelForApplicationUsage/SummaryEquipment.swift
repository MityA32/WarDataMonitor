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
        
        self.drone = summaryEquipmentModel.drone.map { "\($0)" } ?? "None"
        self.navalShip = summaryEquipmentModel.navalShip.map { "\($0)" } ?? "None"
        self.antiAircraftWarfare = summaryEquipmentModel.antiAircraftWarfare.map { "\($0)" } ?? "None"
        self.specialEquipment = summaryEquipmentModel.specialEquipment.map { "\($0)" } ?? "None"
        self.mobileSRBMSystem = summaryEquipmentModel.mobileSRBMSystem.map { "\($0)" } ?? "None"
        self.greatestLossesDirection = summaryEquipmentModel.greatestLossesDirection ?? "None"
        self.vehiclesAndFuelTanks = summaryEquipmentModel.vehiclesAndFuelTanks.map { "\($0)" } ?? "None"
        self.cruiseMissles = summaryEquipmentModel.cruiseMissles.map { "\($0)" } ?? "None"
    }
}
