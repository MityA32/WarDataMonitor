//
//  WarDataDetailsViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import UIKit

final class WarDataDetailsViewController: UIViewController {

    static let nibName = "\(WarDataDetailsViewController.self)"
    
    @IBOutlet private weak var customNavigationBarView: CustomNavigationBarView!
    
    @IBOutlet private weak var detailsOfDayTableView: UITableView!
    
    var personnelInfo: SummaryPersonnel?
    var equipmentInfo: SummaryEquipment?
    let sectionDataSource = Section.allCases
    let generalSectionDataSource = GeneralSectionFields.allCases
    let personnelSectionDataSource = PersonnelSectionFields.allCases
    let equipmentSectionDataSource = EquipmentSectionFields.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
    }

    private func setupView() {
        setupCustomNavigationBar()
        setupTableView()
    }
    
    private func setupCustomNavigationBar() {
        guard let personnelInfo else { return }
        customNavigationBarView.setTitle("Deatils of day \(personnelInfo.day)")
        customNavigationBarView.setupBar(by: .warDataElementDetails)
        customNavigationBarView.popDelegate = self
    }

    private func setupTableView() {
        detailsOfDayTableView.delegate = self
        detailsOfDayTableView.dataSource = self
        detailsOfDayTableView.register(UINib(nibName: WarDataDetailsTableViewCell.id, bundle: nil), forCellReuseIdentifier: WarDataDetailsTableViewCell.id)
        detailsOfDayTableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        detailsOfDayTableView.rowHeight = UITableView.automaticDimension
        detailsOfDayTableView.separatorStyle = .none
    }  
}

extension WarDataDetailsViewController: PopViewControllerDelegate {
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

extension WarDataDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sectionDataSource[section] {
        case .general:
            return generalSectionDataSource.count
        case .personnel:
            return personnelSectionDataSource.count
        case .equipment:
            return equipmentSectionDataSource.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsOfDayTableView.dequeueReusableCell(withIdentifier: WarDataDetailsTableViewCell.id, for: indexPath) as! WarDataDetailsTableViewCell
        cell.isUserInteractionEnabled = false
        guard let personnelInfo,
              let equipmentInfo
        else { return .init() }
        switch sectionDataSource[indexPath.section] {
        case .general:
            cell.configureGeneralSectionCell(from: personnelInfo, by: generalSectionDataSource[indexPath.row])
        case .personnel:
            cell.configurePersonnelSectionCell(from: personnelInfo, by: personnelSectionDataSource[indexPath.row])
        case .equipment:
            cell.configureEquipmentSectionCell(from: equipmentInfo, by: equipmentSectionDataSource[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionDataSource[section].title
    }
    
}

protocol PopViewControllerDelegate: AnyObject {
    func popViewController()
}
