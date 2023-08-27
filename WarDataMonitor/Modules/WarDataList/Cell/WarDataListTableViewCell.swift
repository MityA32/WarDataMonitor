//
//  WarDataListTableViewCell.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

class WarDataListTableViewCell: UITableViewCell {

    static let id = "WarDataListTableViewCell"
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var personnelNumberLabel: UILabel!
    @IBOutlet private weak var powNumberLabel: UILabel!
    
    func configure(from model: SummaryPersonnel) {
        dateLabel.text = "🗓 \(model.date)"
        dayLabel.text = "🌍 Day: \(model.day)"
        personnelNumberLabel.text = "☠️ Personnel: \(model.personnel)"
        powNumberLabel.text = "🏳 POW: \(model.pow)"
    }
    
}
