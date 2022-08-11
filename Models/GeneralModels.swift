//
//  GeneralModels.swift
//  hooley
//
//  Created by Usama Sadiq on 11/7/18.
//  Copyright © 2018 messagemuse. All rights reserved.
//

import Foundation

//struct UserNotificationRecieveModel{
//
//    var id:String?
//    var name:String
//    var imageUrl:String
//    var text:String
//    var type:String
//    var typeId:String?
//    var data:String
//    var isRead:Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case imageURL = "imageUrl"
//        case text, type, data, isRead, date
//    }
//
//}
//
//struct NotificationModel: Codable {
//    let id, name, imageURL: String
//    let text: String?
//    let type, typeId, data: String
//    let isRead: Bool
//    let date: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case imageURL = "imageUrl"
//        case text, type, typeId, data, isRead, date
//    }
//}

// MARK: - DeviceInfo
struct DeviceInfo: Codable {
    let deviceManufacturer: String
    let osType: String
    let model: String
    let osVersion: String
    let udid: String
    let modelNumber: String
    let serialNumber: String
    let macAddress: String
    let deviceToken: String
    let ip: String

    enum CodingKeys: String, CodingKey {
        case deviceManufacturer = "deviceManufacturer"
        case osType = "osType"
        case model = "model"
        case osVersion = "osVersion"
        case udid = "udid"
        case modelNumber = "modelNumber"
        case serialNumber = "serialNumber"
        case macAddress = "macAddress"
        case deviceToken = "deviceToken"
        case ip = "ip"
    }
}

struct BoolResponseModel: Codable {
    let isSuccessful: Bool
    let exception: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccessful = "IsSuccessful"
        case exception = "Exception"
    }
}

struct CardIDResponseModel: Codable {
    let isSuccessful: Bool
    let exception: String
    let cardId: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccessful = "IsSuccessful"
        case exception = "Exception"
        case cardId = "cardId"
    }
}

struct UserIDRequestModel: Codable {
    let userID: Int
    let isGuest: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case isGuest
    }
}

struct GeneralModel<T : Codable>: Codable {
    let isError: Bool
    let messages: String
    let data: T?
}

struct AccessDeniedModel {
    
}

struct CustomError: LocalizedError {
    var description: String?

    init(description: String) {
        self.description = description
    }
}

struct MediaUploadRequestModel: Codable {
    let type: Int
    enum CodingKeys: String, CodingKey {
        case type = "Type"
    }
}

// MARK: - UploadMediaResponseModel
struct MediaUploadResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: [UploadMedia]
}

// MARK: - Datum
struct UploadMedia: Codable {
    let url, thumbURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case thumbURL = "thumbUrl"
    }
}

struct FrameCustomImageModel {
    var url: String?
    var thumbURL: String?
    var image: UIImage?
}

struct NotSuccessModel:Codable {
    let isError: Bool
    let messages: String?
}
