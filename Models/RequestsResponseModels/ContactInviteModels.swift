//
//  ContactInviteModels.swift
//  easypeasy
//
//  Created by Ahmad on 09/12/2020.
//

import Foundation

// MARK: - ContactInviteRequestModel
struct ContactInviteRequestModel: Codable {
    let numbers: [InviteModel]?
}

// MARK: - Number
struct InviteModel: Codable {
    let firstName, lastName, phoneNumber: String?
}




// MARK: - ContactInviteResponseModel
struct ContactInviteResponseModel: Codable {
    let isError: Bool
    let messages: String?
    let data: Bool?
}
