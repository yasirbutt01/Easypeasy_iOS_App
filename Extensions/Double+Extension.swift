//
//  Double+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 13/11/2020.
//

import Foundation

extension Double {
    func numberFormatter(digitAfterPoint:Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = digitAfterPoint
        numberFormatter.minimumFractionDigits = digitAfterPoint
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:self))
        return formattedNumber!
    }
}
