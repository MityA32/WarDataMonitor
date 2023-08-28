//
//  WarDataSpecifiedEquipmentViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import UIKit

final class WarDataSpecifiedEquipmentViewController: UIViewController {
    

    @IBOutlet private weak var customNavigationBarView: CustomNavigationBarView!
    @IBOutlet private weak var specifiedEquipmentLossesTableView: UITableView!
    
    let model = SpecifiedEquipmentLossesModel()
    let equipmentTypes = EquipmentType.allCases
    var hiddenSections = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        setupView()
    }
    
    private func setupView() {
        navigationController?.navigationBar.isHidden = true
        model.didUpdatedPersonnelInfoList = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.specifiedEquipmentLossesTableView.reloadData()
            }
        }
        setupCustomNavigationBar()
        setupTableView()
        hiddenSections = Set(equipmentTypes.indices)
    }
    
    private func setupCustomNavigationBar() {
        customNavigationBarView.setTitle("Specified Equipment Losses")
        customNavigationBarView.setupBar(by: .specifiedEquipmentLosses)
    }
    
    private func setupTableView() {
        specifiedEquipmentLossesTableView.delegate = self
        specifiedEquipmentLossesTableView.dataSource = self
        specifiedEquipmentLossesTableView.register(UINib(nibName: SpecifiedEquipmentLossesTableViewCell.id, bundle: nil), forCellReuseIdentifier: SpecifiedEquipmentLossesTableViewCell.id)
        specifiedEquipmentLossesTableView.separatorStyle = .none
        specifiedEquipmentLossesTableView.rowHeight = UITableView.automaticDimension
    }

}

extension WarDataSpecifiedEquipmentViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        equipmentTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        let equipmentType = equipmentTypes[section]
        if let specifiedEquipmentArray = model.specifiedEquipmentList[equipmentType] {
            return specifiedEquipmentArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = specifiedEquipmentLossesTableView.dequeueReusableCell(withIdentifier: SpecifiedEquipmentLossesTableViewCell.id, for: indexPath) as! SpecifiedEquipmentLossesTableViewCell
        cell.isUserInteractionEnabled = false
        let equipmentType = equipmentTypes[indexPath.section]
        guard let section = self.model.specifiedEquipmentList[equipmentType] else { return .init() }
        cell.configure(from: section[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var configuration = UIButton.Configuration.plain()
        let arrowImageName = isSectionHidden(section) ? "chevron.up" : "chevron.down"
        let arrowImage = UIImage(systemName: arrowImageName)?.withRenderingMode(.alwaysTemplate)
        configuration.image = arrowImage
        configuration.imagePadding = 10
        let title = String(equipmentTypes[section].codingKey)
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .white
        configuration.background = UIBackgroundConfiguration.listPlainCell()
        configuration.background.backgroundColor = UIColor.systemBlue
        configuration.imagePlacement = .trailing
        let sectionButton = UIButton(configuration: configuration)
        sectionButton.tag = section
        sectionButton.addTarget(self,
                                action: #selector(self.hideSection(sender:)),
                                for: .touchUpInside)
        return sectionButton
    }
    
    func isSectionHidden(_ section: Int) -> Bool {
        return hiddenSections.contains(section)
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        let section = sender.tag
        let equipmentType = equipmentTypes[section]
        guard let sizeOfSection = self.model.specifiedEquipmentList[equipmentType]?.count else { return }
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            for row in 0 ..< sizeOfSection {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.specifiedEquipmentLossesTableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.specifiedEquipmentLossesTableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
        let arrowImageName = isSectionHidden(section) ? "chevron.up" : "chevron.down"
        let arrowImage = UIImage(systemName: arrowImageName)
        sender.setImage(arrowImage, for: .normal)
    }
}
