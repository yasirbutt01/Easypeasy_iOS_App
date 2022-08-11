//
//  UIBarButtonItem+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 22/10/2020.
//

import UIKit

private var handle: UInt8 = 0

extension UIBarButtonItem {

    func resetNotificationCount() {
        if let notificationCount = UserDefaults.standard.value(forKey: K.NOTIFICATION_COUNT_KEY) as? Int{
            DispatchQueue.main.async {
                self.badgeValue  = "\(notificationCount)"
                self.badgeBGColor = Colors.GREEN
                UIApplication.shared.applicationIconBadgeNumber = notificationCount
            }
        }else{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
    
    func removeNotificationCount() -> Void {
        UserDefaults.standard.setValue(0, forKey: K.NOTIFICATION_COUNT_KEY)
        badgeValue = "0"
        badgeBGColor = Colors.GREEN
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    private var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    func addBadge(number: Int, withOffset offset: CGPoint = CGPoint.zero, andColor color: UIColor = Colors.RED, andFilled filled: Bool = true) {
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        badgeLayer?.removeFromSuperlayer()
        
        // Initialize Badge
        let badge = CAShapeLayer()
        let radius = CGFloat(4)
        let location = CGPoint(x: view.frame.width - (radius + offset.x), y: (radius + offset.y))
        badge.drawCircleAtLocation(location: location, withRadius: radius, andColor: color, filled: filled)
        view.layer.addSublayer(badge)
        
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func updateBadge(number: Int) {
        if let text = badgeLayer?.sublayers?.filter({ $0 is CATextLayer }).first as? CATextLayer {
            text.string = "\(number)"
        }
    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
    
    
}

