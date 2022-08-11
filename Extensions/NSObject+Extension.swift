//
//  NSObject+Extension.swift
//  easypeasy
//
//  Created by EXIA on 01/10/2020.
//

import Foundation

extension NSObject {

    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
