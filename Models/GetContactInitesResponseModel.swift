//
//  GetContactInitesResponseModel.swift
//  easypeasy
//
//  Created by Ahmad on 05/10/2020.
//

import Foundation

struct GetContactInvitesResponseModel: Codable {
    let phoneContactList: [PhoneContactList]
    let isSuccessful: Bool
    let exception: String
    
    enum CodingKeys: String, CodingKey {
        case phoneContactList = "phoneContactList"
        case isSuccessful = "IsSuccessful"
        case exception = "Exception"
    }
}

// MARK: - PhoneContactList
struct PhoneContactList: Codable {
    let userID: Int
    let contactNumber: String
    let fullName: String
    let profilePic: String
    let stateName: String
    let cityName: String
    let isSent: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case contactNumber = "contactNumber"
        case fullName = "fullName"
        case profilePic = "profilePic"
        case stateName = "stateName"
        case cityName = "cityName"
        case isSent = "isSent"
    }
}
