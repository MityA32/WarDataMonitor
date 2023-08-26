//
//  WarDataListTableViewCell.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

class WarDataListTableViewCell: UITableViewCell {

    static let id = "WarDataListTableViewCell"
    
    @IBOutlet private weak var placeholder: UILabel!
    
   
    
    func configure(from model: String) {
        placeholder.text = model
    }
    
}
