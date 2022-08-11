//
//  Integer+Extension.swift
//  easypeasy
//
//  Created by EXIA on 09/10/2020.
//

import Foundation

extension BinaryInteger {
    var isEven: Bool { isMultiple(of: 2) }
    var isOdd:  Bool { !isEven }
}
