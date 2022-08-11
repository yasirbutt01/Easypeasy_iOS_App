//
//  EGiftModels.swift
//  easypeasy
//
//  Created by Ahmad on 12/11/2020.
//

import Foundation

// MARK: - GetEGifterResponseModel
struct GetEGifterResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: EGiftResponseModel?
}

// MARK: - DataClass
struct EGiftResponseModel: Codable {
    let data: [EGiftModel]?
    let page, pageSize, totalCount: Int?
}

// MARK: - Datum
struct EGiftModel: Codable {
    let id: String?
    let denominations: [Double]?
    var selectedDenomintation: Double?
    let shortDescription, longDescription, name, terms: String?
    let disclaimer, redemptionNote, type, denominationType: String?
    let meta: EGiftMetaModel?
    let media: EGiftMediaModel?
}

// MARK: - Media
struct EGiftMediaModel: Codable {
    let faceplates: [FaceplateModel]?
    let logo: String?
}

// MARK: - Faceplate
struct FaceplateModel: Codable {
    let name: String?
    let path: String?
}

// MARK: - Meta
struct EGiftMetaModel: Codable {
    let supportsAPIBalanceChecks: Bool?
    let website: String?
    let colors: EGiftColorModel?
    
    enum CodingKeys: String, CodingKey {
        case supportsAPIBalanceChecks = "supportsApiBalanceChecks"
        case website, colors
    }
}

// MARK: - Colors
struct EGiftColorModel: Codable {
    let primary, secondary, primaryText, secondaryText: String?
}










// MARK: - EGiftRequestModel
struct EGiftRequestModel: Codable {
    let pageIndex, pageSize: Int
    let productName: String
}
