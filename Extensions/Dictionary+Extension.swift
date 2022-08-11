//
//  Dictionary+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 06/10/2020.
//

import Foundation

extension Dictionary where Key:ExpressibleByStringLiteral {
    
    func convertToJSONString() -> String{
        var paramStr:String!
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self,options: []) {
            paramStr = String(data: theJSONData,
                              encoding: .utf8)!
        }
        return paramStr
    }
}
