//
//  StaticDataResponseModel.swift
//  easypeasy
//
//  Created by EXIA on 08/10/2020.
//

import Foundation

// MARK: - StaticDataResponseModel
struct StaticDataResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: StaticDataModel
}

// MARK: - StaticDataModel
struct StaticDataModel: Codable {
    let isGuest: Bool
    let firstName, lastName: String
    let passwordLength: Int
    let countryCode, phoneNumber, email: String
    let genderID: Int
    let dateOfBirth:String?
    let cropImageURL, cropImageThumbnailURL, imageURL: String
    let imageThumbnailURL: String
    let isSubscribed: Bool
    let paymentMethodCount: Int
    let subscriptionInfo: SubscriptionModel

    enum CodingKeys: String, CodingKey {
        case isGuest, firstName, lastName, passwordLength, countryCode, phoneNumber, email
        case genderID = "genderId"
        case dateOfBirth
        case cropImageURL = "cropImageUrl"
        case cropImageThumbnailURL = "cropImageThumbnailUrl"
        case imageURL = "imageUrl"
        case imageThumbnailURL = "imageThumbnailUrl"
        case isSubscribed, paymentMethodCount, subscriptionInfo
    }
}

// MARK: - SubscriptionModel
struct SubscriptionModel: Codable {
    let status:String?
    let packageID:String
    let expiryDate: String?
    let limit:Int
    let price: Double

    enum CodingKeys: String, CodingKey {
        case packageID = "packageId"
        case expiryDate, limit, price, status
    }
}
