//
//  NSAttributedString+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 23/10/2020.
//

import Foundation

extension NSAttributedString {
    var trailingNewlineChopped: NSAttributedString {
        guard self.length > 0 else {
            return self
        }
        let lastCharRange = NSMakeRange(self.length - 1, 1)
        let lastChar = self.attributedSubstring(from: lastCharRange).string
        guard lastChar == "\n" else {
            return self
        }
        let mutableCopy = NSMutableAttributedString(attributedString: self)
        mutableCopy.deleteCharacters(in: lastCharRange)
        return mutableCopy
    }

}
