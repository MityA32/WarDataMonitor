//
//  SpecifiedEquipmentLossesTableViewCell.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 28.08.2023.
//

import UIKit

class SpecifiedEquipmentLossesTableViewCell: UITableViewCell {

    static let id = "\(SpecifiedEquipmentLossesTableViewCell.self)"
    
    @IBOutlet private weak var modelLabel: UILabel!
    @IBOutlet private weak var manufactureLabel: UILabel!
    @IBOutlet private weak var totalLossesLabel: UILabel!
    
    func configure(from model: SpecifiedEquipment) {
        modelLabel.text = "Model: \(model.model)"
        manufactureLabel.text = "Manufactured in \(model.manufacturer)"
        totalLossesLabel.text = "Total losses(in units): \(model.lossesTotal)"
    }
}
