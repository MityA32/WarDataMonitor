//
//  SectionsOfDetailsScreen.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

enum GeneralSectionFields: CaseIterable {
    case date
    case day
}

extension GeneralSectionFields {
    var title: String {
        switch self {
        case .date:
            return "Date"
        case .day:
            return "Day"
        }
    }
}

enum PersonnelSectionFields: CaseIterable {
    case personnel
    case pow
}

extension PersonnelSectionFields {
    var title: String {
        switch self {
        case .personnel:
            return "Personnel"
        case .pow:
            return "POW"
        }
    }
}

enum EquipmentSectionFields: CaseIterable {
    case aircraft
    case drone
    case helicopter
    case cruiseMissles
    case tank
    case apc
    case fieldArtillery
    case mrl
    case antiAircraftWarfare
    case vehiclesAndFuelTanks
    case mobileSRBMSystem
    case specialEquipment
    case navalShip
    case greatestLossesDirection
}

extension EquipmentSectionFields {
    var title: String {
        switch self {
        case .aircraft:
            return "Aircraft"
        case .drone:
            return "Drone"
        case .helicopter:
            return "Helicopter"
        case .cruiseMissles:
            return "Cruise Missles"
        case .tank:
            return "Tank"
        case .apc:
            return "APC"
        case .fieldArtillery:
            return "Field Artillery"
        case .mrl:
            return "MRL"
        case .antiAircraftWarfare:
            return "Anti-aircraft Warfare"
        case .vehiclesAndFuelTanks:
            return "Vehicles and Fuel Tanks"
        case .mobileSRBMSystem:
            return "Mobile SRBM System"
        case .specialEquipment:
            return "Special Equipment"
        case .navalShip:
            return "Naval Ship"
        case .greatestLossesDirection:
            return "Greatest losses direction"
        }
    }
}

