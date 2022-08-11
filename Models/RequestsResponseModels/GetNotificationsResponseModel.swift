//
//  GetNotificationsResponseModel.swift
//  easypeasy
//
//  Created by Ahmad on 23/10/2020.
//

import Foundation

// MARK: - Datum
//struct NotificationModel: Codable {
//    let id, name, imageURL: String
//    let text: String?
//    let type, data: String
//    let isRead: Bool
//    let date: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case imageURL = "imageUrl"
//        case text, type, data, isRead, date
//    }
//}

struct NotificationModel: Codable {
    let id, name, imageURL: String
    let text: String?
    let type: String
    let typeId:String?
    let data: String
    let isRead: Bool
    let date: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
        case text, type, typeId, data, isRead, date
    }
}
