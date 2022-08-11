//
//  SignupModel.swift
//  easypeasy
//
//  Created by Ahmad on 08/10/2020.
//

import Foundation

// MARK: - SignupRequestModel
struct SignupRequestModel: Codable {
    let firstName, lastName, countryCode, phoneNumber: String
    let password, email: String
    let genderID: Int
    let dateOfBirth, cropImageURL, cropImageThumbnailURL, imageURL: String
    let imageThumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, countryCode, phoneNumber, password, email
        case genderID = "genderId"
        case dateOfBirth
        case cropImageURL = "cropImageUrl"
        case cropImageThumbnailURL = "cropImageThumbnailUrl"
        case imageURL = "imageUrl"
        case imageThumbnailURL = "imageThumbnailUrl"
    }
}
