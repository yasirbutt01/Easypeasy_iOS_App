//
//  UIControl+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 22/10/2020.
//

import UIKit

extension UIControl {
    public func removeAllTarget() {
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
}
