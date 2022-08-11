//
//  UITextField+Extension.swift
//  easypeasy
//
//  Created by EXIA on 02/10/2020.
//

import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
            get {
                guard let l = __maxLengths[self] else {
                   return 150 // (global default-limit. or just, Int.max)
                }
                return l
            }
            set {
                __maxLengths[self] = newValue
                addTarget(self, action: #selector(fix), for: .editingChanged)
            }
        }
    @objc func fix(textField: UITextField) {
        if let t: String = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
    
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }

}
