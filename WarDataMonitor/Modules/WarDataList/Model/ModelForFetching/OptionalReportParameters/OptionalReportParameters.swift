//
//  OptionalReportParameters.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

enum POWQuantityInfo {
    case number(Int)
    case none
}

enum MilitaryAutoQuantityInfo {
    case number(Int)
    case none
}

enum FuelTankQuantityInfo {
    case number(Int)
    case none
}

enum DroneQuantityInfo {
    case number(Int)
    case none
}

enum NavalShipQuantityInfo {
    case number(Int)
    case none
}

enum AntiAircraftWarfareQuantityInfo {
    case number(Int)
    case none
}

enum SpecialEquipmentQuantityInfo {
    case number(Int)
    case none
}

enum MobileSRBMSystemQuantityInfo {
    case number(Int)
    case none
}

enum GreatestLossesDirectionInfo {
    case direction(String)
    case none
}

enum VehiclesAndFuelTanksQuantityInfo {
    case number(Int)
    case none
}

enum CruiseMisslesQuantityInfo {
    case number(Int)
    case none
}
