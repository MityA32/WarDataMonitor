//
//  ViewController.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 25.08.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.backgroundColor = UIColor.red.cgColor
    }


}

