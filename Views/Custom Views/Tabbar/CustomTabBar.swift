//
//  CustomTabBar.swift
//  easypeasy
//
//  Created by Ahmad on 05/10/2020.
//

import Foundation
import UIKit

class CustomTabBar : UITabBar {
    @IBInspectable var height: CGFloat = 84.0
    
    private var cachedSafeAreaInsets = UIEdgeInsets.zero

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
       
        if #available(iOS 11.0, *) {
            sizeThatFits.height = height + window.safeAreaInsets.bottom
        } else {
            // Fallback on earlier versions
            if height > 0.0 {
                sizeThatFits.height = height
            }
        }
        return sizeThatFits
    }
}
