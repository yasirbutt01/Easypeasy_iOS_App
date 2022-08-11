//
//  UIApplication+Extension.swift
//  easypeasy
//
//  Created by EXIA on 01/10/2020.
//

import UIKit

public extension UIApplication {

    func clearLaunchScreenCache() {
        #if DEBUG
        do {
            let launchScreenPath = "\(NSHomeDirectory())/Library/SplashBoard"
            try FileManager.default.removeItem(atPath: launchScreenPath)
        } catch {
            print("Failed to delete launch screen cache - \(error)")
        }
        #endif
    }
}

extension UIApplication {
    var visibleViewController : UIViewController? {
        return windows.first?.rootViewController?.topMostViewController
    }
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
