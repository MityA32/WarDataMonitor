//
//  CustomNavigationBarView.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

final class CustomNavigationBarView: UIView {
    
    
    
    @IBOutlet private weak var navigationTitleLabel: UILabel!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var leadingNavigationBarItemButton: UIButton!
    weak var popDelegate: PopViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("\(CustomNavigationBarView.self)", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setupBar(by type: Screen) {
        switch type {
        case .warDataList, .specifiedEquipmentLosses:
            leadingNavigationBarItemButton.isHidden = true
        case .warDataElementDetails:
            leadingNavigationBarItemButton.isHidden = false
            leadingNavigationBarItemButton.addTarget(popDelegate, action: #selector(leadingButtonTapped), for: .touchUpInside)
        }
    }
    
    func setTitle(_ title: String) {
        navigationTitleLabel.text = title
        navigationTitleLabel.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    @objc private func leadingButtonTapped() {
        popDelegate?.popViewController()
    }
}
