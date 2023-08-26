//
//  CustomNavigationBarView.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 26.08.2023.
//

import UIKit

class CustomNavigationBarView: UIView {
    
    
    @IBOutlet private weak var navigationTitleLabel: UILabel!
    @IBOutlet private weak var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("CustomNavigationBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setTitle(_ title: String) {
        navigationTitleLabel.text = title
        navigationTitleLabel.font = .systemFont(ofSize: 32, weight: .bold)
    }
}
