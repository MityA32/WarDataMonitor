//
//  WarDataListViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

class WarDataListViewController: UIViewController {

    
    @IBOutlet private weak var aboveCustomNavigationBarView: UIView!
    @IBOutlet private weak var navigationBarView: CustomNavigationBarView!
    @IBOutlet private weak var warDataTableView: UITableView!
    
    var model: [String] = ["abc1","abc2","abc3","abc4","abc5","abc6","abc7","abc8","abc9","abc10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBarView.layer.backgroundColor = UIColor.systemGray5.cgColor
    }
    
    private func setup() {
        
        setupView()
    }
    
    private func setupView() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationBarView.setTitle("War Data List")
        aboveCustomNavigationBarView.backgroundColor = .systemGray5
    }
    
    private func setupTableView() {
        warDataTableView.delegate = self
        warDataTableView.dataSource = self
        
        warDataTableView.register(UINib(nibName: "WarDataListTableViewCell", bundle: nil), forCellReuseIdentifier: WarDataListTableViewCell.id)
    }
    
}

extension WarDataListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = warDataTableView.dequeueReusableCell(withIdentifier: WarDataListTableViewCell.id, for: indexPath) as! WarDataListTableViewCell
        cell.configure(from: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
