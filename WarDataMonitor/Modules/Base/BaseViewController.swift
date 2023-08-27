//
//  ViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 25.08.2023.
//

import UIKit

class BaseViewController: UITabBarController {

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
        warDataListVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))
        
        let warDataSpecifiedEquipmentList = WarDataSpecifiedEquipmentViewController(nibName: "\(WarDataSpecifiedEquipmentViewController.self)", bundle: nil)
        let warDataSpecifiedEquipmentListVC = UINavigationController(rootViewController: warDataSpecifiedEquipmentList)
        warDataSpecifiedEquipmentListVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        viewControllers = [warDataListVC, warDataSpecifiedEquipmentListVC]
        tabBar.backgroundColor = .systemGray5
    }
}

