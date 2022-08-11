//
//  CustomBarButtonItem.swift
//  easypeasy
//
//  Created by Ahmad on 14/10/2020.
//

import UIKit

class CustomBarButtonItem: UIBarButtonItem {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        self.setTitleTextAttributes( [
            NSAttributedString.Key.font : Fonts.HELVETICA_REGULAR_12,
        ], for: .normal)
        self.setTitleTextAttributes( [
            NSAttributedString.Key.font : Fonts.HELVETICA_REGULAR_12,
        ], for: .disabled)
    }
    
    func showButton() {
        self.tintColor = Colors.GREEN
        self.isEnabled = true
    }
    
    func hideButton() {
        self.tintColor = .clear
        self.isEnabled = false
    }
    
    func disableButton() {
        self.tintColor = Colors.LIGHT_GRAY
        self.isEnabled = false
    }
}
