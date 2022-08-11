//
//  CreateGroupRequestModel.swift
//  easypeasy
//
//  Created by Ahmad on 15/10/2020.
//

import Foundation

// MARK: - CreateGroupRequestModel
struct CreateGroupRequestModel: Codable {
    let name: String
    let details: [DetailModel]
}

// MARK: - Detail
struct DetailModel: Codable {
    let userID: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
    }
}
