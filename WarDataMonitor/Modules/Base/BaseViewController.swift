//
//  ViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 25.08.2023.
//

import UIKit

final class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.isHidden = true
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let warDataList = WarDataListViewController(nibName: "\(WarDataListViewController.self)", bundle: nil)
        let warDataListVC = UINavigationController(rootViewController: warDataList)
        warDataListVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "info.circle"), selectedImage: UIImage(systemName: "info.circle.fill"))
        
        let warDataSpecifiedEquipmentList = WarDataSpecifiedEquipmentViewController(nibName: "\(WarDataSpecifiedEquipmentViewController.self)", bundle: nil)
        let warDataSpecifiedEquipmentListVC = UINavigationController(rootViewController: warDataSpecifiedEquipmentList)
        warDataSpecifiedEquipmentListVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "car"), selectedImage: UIImage(systemName: "car.fill"))
        
        viewControllers = [warDataListVC, warDataSpecifiedEquipmentListVC]
        tabBar.backgroundColor = .systemGray5
    }
}

