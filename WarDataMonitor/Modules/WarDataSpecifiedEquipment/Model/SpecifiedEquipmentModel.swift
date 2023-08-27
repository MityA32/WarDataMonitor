//
//  SpecifiedEquipmentModel.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 28.08.2023.
//

import Foundation

struct SpecifiedEquipmentModel: Decodable {
    let equipmentOryx: String
    let model: String
    let manufacturer: String
    let lossesTotal: Int
    let equipmentUA: String
    
    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model = "model"
        case manufacturer = "manufacturer"
        case lossesTotal = "losses_total"
        case equipmentUA = "equipment_ua"
    }
}
