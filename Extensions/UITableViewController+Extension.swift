//
//  UITableViewController+Extension.swift
//  easypeasy
//
//  Created by EXIA on 26/11/2020.
//

import Foundation


extension UITableViewController {
    func showToastInTableView(message : String, font: UIFont = .systemFont(ofSize: 12.0)) {
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        let toastLabel = UILabel(frame: CGRect(x: 10, y: self.view.frame.size.height-200, width: self.view.frame.width - 20, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 3.0, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

