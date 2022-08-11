//
//  UpdateGroupRequestModel.swift
//  easypeasy
//
//  Created by Ahmad on 15/10/2020.
//

import Foundation

// MARK: - UpdateGroupRequestModel
struct UpdateGroupRequestModel: Codable {
    let id, name: String
    let details: [DetailModel]
}
