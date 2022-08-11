//
//  LoginModels.swift
//  easypeasy
//
//  Created by EXIA on 07/10/2020.
//

import Foundation

// MARK: - LoginRequestModel
struct LoginRequestModel: Codable {
    let isGuest: Bool
    let countryCode, phoneNumber, password, deviceToken: String
    let deviceModel, os, version: String
    let deviceType: Int
}

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: LoginModel
}

// MARK: - DataModel
struct LoginModel: Codable {
    let userID:String?
    let accessToken: String
    let isGuest: Bool
    let syncContactCount: Int

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case accessToken, isGuest, syncContactCount
    }
}
