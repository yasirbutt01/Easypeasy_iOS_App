//
//  CAShapeLayer+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 24/11/2020.
//

import UIKit
import Foundation

extension CAShapeLayer {
    func drawCircleAtLocation(location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = UIColor.white.cgColor
        let origin = CGPoint(x: (location.x - radius) - 1, y: (location.y - radius) + 15)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}
