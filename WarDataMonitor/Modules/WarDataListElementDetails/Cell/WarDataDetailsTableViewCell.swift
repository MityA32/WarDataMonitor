//
//  WarDataDetailsTableViewCell.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import UIKit

class WarDataDetailsTableViewCell: UITableViewCell {

    static let id = "\(WarDataDetailsTableViewCell.self)"
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    func configureGeneralSectionCell(from model: SummaryPersonnel, by row: GeneralSectionFields) {
        switch row {
            case .date:
                infoLabel.text = model.date
        }
    }
    
    func configurePersonnelSectionCell(from model: SummaryPersonnel, by row: PersonnelSectionFields) {
        switch row {
        case .personnel:
            infoLabel.text = "Personnel: \(model.personnel)"
        case .pow:
            infoLabel.text = "POW: \(model.pow)"
        }
    }
    
    func configureEquipmentSectionCell(from model: SummaryEquipment, by row: EquipmentSectionFields) {
        switch row {
            case .aircraft:
                infoLabel.text = "Aircraft: \(model.aircraft)"
            case .drone:
                infoLabel.text = "Helicopter: \(model.helicopter)"
            case .helicopter:
                infoLabel.text = "Tank: \(model.tank)"
            case .cruiseMissles:
                infoLabel.text = "APC: \(model.apc)"
            case .tank:
                infoLabel.text = "Field Artillery: \(model.fieldArtillery)"
            case .apc:
                infoLabel.text = "MRL: \(model.mrl)"
            case .fieldArtillery:
                infoLabel.text = "Drone: \(model.drone)"
            case .mrl:
                infoLabel.text = "Naval Ship: \(model.navalShip)"
            case .antiAircraftWarfare:
                infoLabel.text = "Anti-Aircraft Warfare: \(model.antiAircraftWarfare)"
            case .vehiclesAndFuelTanks:
                infoLabel.text = "Special Equipment: \(model.specialEquipment)"
            case .mobileSRBMSystem:
                infoLabel.text = "Mobile SRBM System: \(model.mobileSRBMSystem)"
            case .specialEquipment:
                infoLabel.text = "Greatest Losses Direction: \(model.greatestLossesDirection)"
            case .navalShip:
                infoLabel.text = "Vehicles and Fuel Tanks: \(model.vehiclesAndFuelTanks)"
            case .greatestLossesDirection:
                infoLabel.text = "Cruise Missles: \(model.cruiseMissles)"
        }
    }
    
    func configure<T, Row: CaseIterable>(from model: T, section: Section, row: Row) {
        switch section {
        case .general:
            guard let model = model as? SummaryPersonnel,
                  let row = row as? GeneralSectionFields else { return }
            
        case .personnel:
            guard let model = model as? SummaryPersonnel,
                  let row = row as? PersonnelSectionFields else { return }
            
        case .equipment:
            guard let model = model as? SummaryEquipment,
                  let row = row as? EquipmentSectionFields else { return }
            
        }
    }
}
