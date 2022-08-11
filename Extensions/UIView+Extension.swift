//
//  UIView+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 02/10/2020.
//

import UIKit
import MBProgressHUD

extension UIView {
    
    /*
    /// Create image snapshot of view.
        ///
        /// - Parameters:
        ///   - rect: The coordinates (in the view's own coordinate space) to be captured. If omitted, the entire `bounds` will be captured.
        ///   - afterScreenUpdates: A Boolean value that indicates whether the snapshot should be rendered after recent changes have been incorporated. Specify the value false if you want to render a snapshot in the view hierarchy’s current state, which might not include recent changes. Defaults to `true`.
        ///
        /// - Returns: The `UIImage` snapshot.

        func snapshot(of rect: CGRect? = nil, afterScreenUpdates: Bool = true) -> UIImage {
            return UIGraphicsImageRenderer(bounds: rect ?? bounds).image { _ in
                drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
            }
        }
    */
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func roundWithCorners(corners:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            print("not able to round specific corner")
        }
    }
    
    func addShadow(color:UIColor, opacity:Float, radius:CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func roundedUIView(withRadius radius: CGFloat){
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func simpleRound() -> Void {
        layer.cornerRadius = self.frame.height/2
        clipsToBounds = true
    }
    
    func roundedUIView(withRadius radius: CGFloat,withBorderColor color:UIColor,borderWidth:CGFloat = 1){
        layer.cornerRadius = radius
        clipsToBounds = true
        layer.borderColor = color.cgColor
        layer.borderWidth = borderWidth
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addKeyboardGesture() {
        self.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func showProgressOnView(title:String = K.LOADING_KEY) -> Void {
        DispatchQueue.main.async {
            let progressHud = MBProgressHUD.showAdded(to: self, animated: true)
            progressHud.label.text = title
        }
    }
    
    func hideProgressOnView() -> Void {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self , animated: true)
        }
    }
    
    
    func zoomIn(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = .identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration : TimeInterval = 0.2) {
        self.transform = .identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = .identity
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.speed = 0.8
        pulse.fromValue = 0.90
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1000
        pulse.initialVelocity = 0.0
//        pulse.damping = 0.8
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func fadeIn(duration: TimeInterval = 0.65,
                delay: TimeInterval = 0.0,
                completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
      UIView.animate(withDuration: duration,
                     delay: delay,
                     options: UIView.AnimationOptions.transitionFlipFromTop,
                     animations: {
        self.alpha = 1.0
      }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.65,
                 delay: TimeInterval = 0.0,
                 completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
      UIView.animate(withDuration: duration,
                     delay: delay,
                     options: UIView.AnimationOptions.transitionFlipFromTop,
                     animations: {
        self.alpha = 0.0
      }, completion: completion)
    }
    
    func snapshotView(_ frame: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: frame.origin.x * -1, y: frame.origin.y * -1)
        
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
