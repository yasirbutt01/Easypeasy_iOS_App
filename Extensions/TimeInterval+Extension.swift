//
//  TimeInterval+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 08/10/2020.
//

import Foundation

extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
        
        let time = NSInteger(self)
        
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
        
    }
}
