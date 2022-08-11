//
//  SendCardRequestModel.swift
//  easypeasy
//
//  Created by Ahmad on 16/10/2020.
//

import Foundation

//// MARK: - SendCardRequestModel
//struct SendCardRequestModel: Codable {
//    let cardID: String?
//    let categoryID, sendCardRequestModelDescription: String
//    let fontID: Int
//    let categoryMusicFileID: String?
//    let isSentInGroup: Bool
//    let userGroupID: String?
//    let isScheduled: Bool
//    var scheduledDate: String?
//    let videoURL, videoThumbURL: String?
//    let isReminder: Bool
//    let details: [CardDetailModel]
//
//    enum CodingKeys: String, CodingKey {
//        case cardID = "cardId"
//        case categoryID = "categoryId"
//        case sendCardRequestModelDescription = "description"
//        case fontID = "fontId"
//        case categoryMusicFileID = "categoryMusicFileId"
//        case isSentInGroup
//        case userGroupID = "userGroupId"
//        case isScheduled, scheduledDate
//        case videoURL = "videoUrl"
//        case videoThumbURL = "videoThumbUrl"
//        case isReminder, details
//    }
//}

// MARK: - Detail
struct CardDetailModel: Codable {
    let sentToID, sentToName, sentToPhoneNumber: String?

       enum CodingKeys: String, CodingKey {
           case sentToID = "sentToId"
           case sentToName, sentToPhoneNumber
       }
}


// MARK: - SendCardRequestModel
struct SendCardRequestModel: Codable {
    let cardID: String?
    let categoryID: String
    let sendCardRequestModelDescription: String
    let fontID: Int
    let categoryMusicFileID: String?
    let isSentInGroup: Bool
    let userGroupID: String?
    let isScheduled: Bool
    var scheduledDate: String?
    let videoURL: String
    let videoThumbURL: String?
    var isReminder, iseGiftAttached: Bool
    var eGiftDetail: EGiftDetailModel?
    let details: [CardDetailModel]
    let images: [FrameImageModel]?
    
    enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case categoryID = "categoryId"
        case sendCardRequestModelDescription = "description"
        case fontID = "fontId"
        case categoryMusicFileID = "categoryMusicFileId"
        case isSentInGroup
        case userGroupID = "userGroupId"
        case isScheduled, scheduledDate
        case videoURL = "videoUrl"
        case videoThumbURL = "videoThumbUrl"
        case isReminder, iseGiftAttached, eGiftDetail, details, images
    }
}

// MARK: - EGiftDetail
struct EGiftDetailModel: Codable {
    var paymentMethodID: String?
    let productID: String?
    let cardValue, feeAmount, totalAmount: Double?
    let denominationType, brandName, cardImageURL: String?
    let primaryColor: String?
    let secondaryColor: String?

    enum CodingKeys: String, CodingKey {
        case paymentMethodID = "paymentMethodId"
        case productID = "productId"
        case cardValue, feeAmount, totalAmount, denominationType, brandName
        case cardImageURL = "cardImageUrl"
        case primaryColor, secondaryColor
    }
}


// MARK: - Image
struct FrameImageModel: Codable {
    let imageFileURL: String
    let imageFileThumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case imageFileURL = "imageFileUrl"
        case imageFileThumbnailURL = "imageFileThumbnailUrl"
    }
}

struct CustomSendCardModel {
    var requestModel : SendCardRequestModel
    var selectedCardModel : Card?
    var categoryModel : Category?
    var contactModel : UserContactModel?
    var groupModel : GroupModel?
    var cardModel : APICardModel?
    var amountWithoutFee : Double?
}
