//
//  SpecifiedEquipmentLossesTableViewCell.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 28.08.2023.
//

import UIKit

class SpecifiedEquipmentLossesTableViewCell: UITableViewCell {
    static let id = "\(SpecifiedEquipmentLossesTableViewCell.self)"
    
    @IBOutlet private weak var infoStackView: UIStackView!
    @IBOutlet private weak var modelLabel: UILabel!
    @IBOutlet private weak var manufactureLabel: UILabel!
    @IBOutlet private weak var totalLossesLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
    
    func configure(from model: SpecifiedEquipment) {
        infoStackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        infoStackView.isLayoutMarginsRelativeArrangement = true
        modelLabel.text = model.model
        manufactureLabel.text = "Manufactured in \(model.manufacturer)"
        totalLossesLabel.text = "Total losses(in units): \(model.lossesTotal)"
    }
}
