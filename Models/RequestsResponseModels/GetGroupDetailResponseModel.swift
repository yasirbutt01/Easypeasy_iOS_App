//
//  GetGroupDetailResponseModel.swift
//  easypeasy
//
//  Created by Ahmad on 15/10/2020.
//

import Foundation

struct GroupDetailModel: Codable {
    let userID, name, phoneNumber: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, phoneNumber
    }
}
