//
//  SpecifiedEquipment.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 28.08.2023.
//

import Foundation

struct SpecifiedEquipment {
    let equipmentType: EquipmentType
    let model: String
    let manufacturer: String
    let lossesTotal: Int
    
    init(from model: SpecifiedEquipmentModel) {
        self.equipmentType = EquipmentType.allCases.first(where: { $0.codingKey == model.equipmentOryx }) ?? .unknown
        self.model = model.model
        self.manufacturer = model.manufacturer
        self.lossesTotal = model.lossesTotal
    }
}

enum EquipmentType: CaseIterable {
    case tank
    case armouredFightingVehicle
    case infantryFightingVehicle
    case armouredPersonnelCarrier
    case mineResistantAmbushProtected
    case infantryMobilityVehicle
    case commandPostsAndCommunicationsStation
    case engineeringVehiclesAndEquipment
    case selfPropelledAntiTankMissileSystem
    case artillerySupportVehiclesAndEquipment
    case towedArtillery
    case selfPropelledArtillery
    case multipleRocketLauncher
    case antiAircraftGun
    case selfPropelledAntiAircraftGun
    case surfaceToAirMissileSystem
    case radar
    case jammersAndDeceptionSystem
    case aircraft
    case helicopter
    case unmannedCombatAerialVehicle
    case reconnaissanceUnmannedAerialVehicle
    case navalShip
    case trucksVehiclesAndJeeps
    case unknown
}

extension EquipmentType {
    var codingKey: String {
        switch self {
        case .tank:
            return "Tanks"
        case .armouredFightingVehicle:
            return "Armoured Fighting Vehicles"
        case .infantryFightingVehicle:
            return "Infantry Fighting Vehicles"
        case .armouredPersonnelCarrier:
            return "Armoured Personnel Carriers"
        case .mineResistantAmbushProtected:
            return "Mine-Resistant Ambush Protected"
        case .infantryMobilityVehicle:
            return "Infantry Mobility Vehicles"
        case .commandPostsAndCommunicationsStation:
            return "Command Posts And Communications Stations"
        case .engineeringVehiclesAndEquipment:
            return "Engineering Vehicles And Equipment"
        case .selfPropelledAntiTankMissileSystem:
            return "Self-Propelled Anti-Tank Missile Systems"
        case .artillerySupportVehiclesAndEquipment:
            return "Artillery Support Vehicles And Equipment"
        case .towedArtillery:
            return "Towed Artillery"
        case .selfPropelledArtillery:
            return "Self-Propelled Artillery"
        case .multipleRocketLauncher:
            return "Multiple Rocket Launchers"
        case .antiAircraftGun:
            return "Anti-Aircraft Guns"
        case .selfPropelledAntiAircraftGun:
            return "Self-Propelled Anti-Aircraft Guns"
        case .surfaceToAirMissileSystem:
            return "Surface-To-Air Missile Systems"
        case .radar:
            return "Radars"
        case .jammersAndDeceptionSystem:
            return "Jammers And Deception Systems"
        case .aircraft:
            return "Aircraft"
        case .helicopter:
            return "Helicopters"
        case .unmannedCombatAerialVehicle:
            return "Unmanned Combat Aerial Vehicles"
        case .reconnaissanceUnmannedAerialVehicle:
            return "Reconnaissance Unmanned Aerial Vehicles"
        case .navalShip:
            return "Naval Ships"
        case .trucksVehiclesAndJeeps:
            return "Trucks, Vehicles and Jeeps"
        case .unknown:
            return "Unknown"
        }
    }
}
