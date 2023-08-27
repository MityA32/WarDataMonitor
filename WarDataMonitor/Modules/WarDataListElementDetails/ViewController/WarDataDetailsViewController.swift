//
//  WarDataDetailsViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import UIKit

class WarDataDetailsViewController: UIViewController {

    static let nibName = "WarDataDetailsViewController"
    
    @IBOutlet weak var customNavigationBarView: CustomNavigationBarView!
    
    var personnelInfo: SummaryPersonnel?
    var equipmentInfo: SummaryEquipment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        setupView()
    }

    private func setupView() {
        guard let personnelInfo else { return }
        customNavigationBarView.setTitle("Deatils of day \(personnelInfo.day)")
        customNavigationBarView.setupBar(by: .warDataElementDetails)
        customNavigationBarView.popDelegate = self
    }
    
    
}

extension WarDataDetailsViewController: PopViewControllerDelegate {
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}



protocol PopViewControllerDelegate: AnyObject {
    func popViewController()
}
