//
//  GetMyReceivedCardsResponseModel.swift
//  easypeasy
//
//  Created by Ahmad on 20/10/2020.
//

import Foundation

struct GetMyCardsResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: CardResponseModel?
}

// MARK: - Datum

// MARK: - DataClass
struct CardResponseModel: Codable {
    let archiveCount: Int?
    let cardList: [APICardModel]?
}

struct APICardModel: Codable {
    var id: String?
    var userCropImageThumbnailUrl: String?
    var isSentInGroup: Bool
    var groupCount:Int?
    var phoneNumber:String?
    var greetingTypeID: Int?
    var name, categoryName, categoryIconFileURL, categoryIconFileThumbnailURL: String?
    var categoryGIFFileURL, categoryJSONFileURL, date: String?
    var isOpen, isAchived: Bool
    var thumbnailURL, datumDescription, videoURL, videoThumbnailURL: String?
    var fontID: Int?
    var musicURL: String?
    var musicName:String?
    var iseGiftAttached: Bool
    var eGiftDetail: EGiftsReceivedDetailModel?
    var images: [FrameCardImageModel]?

    enum CodingKeys: String, CodingKey {
        case id
        case userCropImageThumbnailUrl
        case isSentInGroup
        case groupCount
        case greetingTypeID = "greetingTypeId"
        case name, categoryName
        case categoryIconFileURL = "categoryIconFileUrl"
        case categoryIconFileThumbnailURL = "categoryIconFileThumbnailUrl"
        case categoryGIFFileURL = "categoryGifFileUrl"
        case categoryJSONFileURL = "categoryJsonFileUrl"
        case date, isOpen, isAchived
        case thumbnailURL = "thumbnailUrl"
        case datumDescription = "description"
        case videoURL = "videoUrl"
        case videoThumbnailURL = "videoThumbnailUrl"
        case fontID = "fontId"
        case musicURL = "musicUrl"
        case iseGiftAttached, eGiftDetail, images
        case phoneNumber = "phoneNumber"
        case musicName = "musicName"
        
    }
}

// MARK: - PaymentDetailModel
struct PaymentDetailModel: Codable {
    let paymentMethodType: Int?
    let cardMaskedCardNumber, expiryDate, paypalEmail, paymentMethodImageURL: String
    let cardValue, feeAmount, totalAmount: Double

    enum CodingKeys: String, CodingKey {
        case paymentMethodType, cardMaskedCardNumber, expiryDate, paypalEmail
        case paymentMethodImageURL = "paymentMethodImageUrl"
        case cardValue, feeAmount, totalAmount
    }
}

struct EGiftsReceivedDetailModel: Codable {
    let productID, status, brandName, cardImageURL: String?
    let cardValue: Double?
    let claimLink, claimLinkAnswer: String?
    let primaryColor:String?
    let secondaryColor:String?
    let paymentDetails: PaymentDetailModel?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case status
        case brandName
        case cardImageURL = "cardImageUrl"
        case cardValue, claimLink, claimLinkAnswer, primaryColor, secondaryColor, paymentDetails
    }
}

// MARK: - Image
struct FrameCardImageModel: Codable {
    let imageFileURL, imageFileThumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case imageFileURL = "imageFileUrl"
        case imageFileThumbnailURL = "imageFileThumbnailUrl"
    }
}

// MARK: - GetMyCardsRequestModel
struct GetMyCardsRequestModel: Codable {
    let skip, take: Int
    let isArchive: Bool
    let categoryID: String?
    let iseGiftAttached: Bool
    let isScheduled: Bool
    
    enum CodingKeys: String, CodingKey {
        case skip, take, isArchive
        case categoryID = "categoryId"
        case iseGiftAttached
        case isScheduled
    }
}
