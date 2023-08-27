//
//  WarDataListViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

final class WarDataListViewController: UIViewController {

    
    @IBOutlet private weak var aboveCustomNavigationBarView: UIView!
    @IBOutlet private weak var navigationBarView: CustomNavigationBarView!
    @IBOutlet private weak var warDataTableView: UITableView!
    
    var model = SummaryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBarView.layer.backgroundColor = UIColor.systemGray5.cgColor
    }
    
    private func setup() {
        
        model.didUpdatedPersonnelInfoList = {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.warDataTableView.reloadData()
            }
        }
        setupView()
    }
    
    private func setupView() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationBarView.setTitle("War Data List")
        navigationBarView.setupBar(by: .warDataList)
        aboveCustomNavigationBarView.backgroundColor = .systemGray5
    }
    
    private func setupTableView() {
        warDataTableView.delegate = self
        warDataTableView.dataSource = self
        warDataTableView.separatorStyle = .none
        warDataTableView.backgroundColor = .systemGray6
        warDataTableView.register(UINib(nibName: "\(WarDataListTableViewCell.self)", bundle: nil), forCellReuseIdentifier: WarDataListTableViewCell.id)
    }
    
}

extension WarDataListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.personnelInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = warDataTableView.dequeueReusableCell(withIdentifier: WarDataListTableViewCell.id, for: indexPath) as! WarDataListTableViewCell
        let size = model.personnelInfo.count
        cell.configure(from: model.personnelInfo[size - indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        WarDataListTableViewConfiguration.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let warDataDetails = WarDataDetailsViewController(nibName: WarDataDetailsViewController.nibName, bundle: nil)
        let size = model.personnelInfo.count
        warDataDetails.personnelInfo = model.personnelInfo[size - indexPath.row - 1]
        warDataDetails.equipmentInfo = model.equipmentInfo[size - indexPath.row - 1]
        navigationController?.pushViewController(warDataDetails, animated: true)
    }
    
}
