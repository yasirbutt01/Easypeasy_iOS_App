//
//  HomeCatogriesModel.swift
//  easypeasy
//
//  Created by Akhtar on 10/7/20.
//

import Foundation

//// MARK: - HomeCatogriesModel
//struct HomeCatogriesModel: Codable {
//    let isError: Bool
//    let messages: String
//    let data: DataClass
//
//    enum CodingKeys: String, CodingKey {
//        case isError = "isError"
//        case messages = "messages"
//        case data = "data"
//    }
//}

// MARK: - HomeCategoriesRequestModel
struct HomeCategoriesRequestModel: Codable {
    let skip, take: Int
    let search: String
}


// MARK: - DataClass
struct HomeCatogriesModel: Codable {
    let totalCategories: Int
    let categories: [Category]

    enum CodingKeys: String, CodingKey {
        case totalCategories = "totalCategories"
        case categories = "categories"
    }
}

// MARK: - Category
struct Category: Codable {
    let id:String
    let name: String
    let greetingTypeID, totalCards: Int
    let iconFileURL, iconFileThumbnailURL: String?
    let gifFileURL: String?
    let jsonFileURL: String?
    let webInactiveIconFileURL, webInactiveIconFileThumbnailURL, webActiveIconFileURL, webActiveIconFileThumbnailURL: String?
    let cards: [Card]?
    let musicList: [MusicModel]?
    var isCheckIconHiden:Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case totalCards
        case greetingTypeID = "greetingTypeId"
        case iconFileURL = "iconFileUrl"
        case iconFileThumbnailURL = "iconFileThumbnailUrl"
        case gifFileURL = "gifFileUrl"
        case jsonFileURL = "jsonFileUrl"
        case webInactiveIconFileURL = "webInactiveIconFileUrl"
        case webInactiveIconFileThumbnailURL = "webInactiveIconFileThumbnailUrl"
        case webActiveIconFileURL = "webActiveIconFileUrl"
        case webActiveIconFileThumbnailURL = "webActiveIconFileThumbnailUrl"
        case cards, musicList
        case isCheckIconHiden = "isCheckIconHiden"
    }
}

// MARK: - Card
struct Card: Codable {
    let id: String
    let categoryID: String
    let frontContent: String?
    let insideContent: String?
    let cardFileURL: String
    let cardFileThumbnailURL: String
    let isEgiftEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categoryID = "categoryId"
        case frontContent = "frontContent"
        case insideContent = "insideContent"
        case cardFileURL = "cardFileUrl"
        case cardFileThumbnailURL = "cardFileThumbnailUrl"
        case isEgiftEnabled = "isEgiftEnabled"
    }
}

// MARK: - MusicList
struct MusicModel: Codable {
    let id: String
    let categoryID: String
    let name: String
    let mp3FileURL: String
    let wavFileURL: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categoryID = "categoryId"
        case name = "name"
        case mp3FileURL = "mp3FileUrl"
        case wavFileURL = "wavFileUrl"
    }
}


// MARK: - CatogriesCardModel
struct CatogriesCardModel: Codable {
    let totalCards: Int
    let cards: [Card]

    enum CodingKeys: String, CodingKey {
        case totalCards = "totalCards"
        case cards = "cards"
    }
}

