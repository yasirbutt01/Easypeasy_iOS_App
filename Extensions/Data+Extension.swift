//
//  Data+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 06/10/2020.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
}
