//
//  GetSubscriptionsResponseModel.swift
//  easypeasy
//
//  Created by EXIA on 23/10/2020.
//

import Foundation

// MARK: - GetSubscriptionsResponseModel
struct GetSubscriptionsResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: ActiveSubscriptionModel
}

// MARK: - SubscriptionModel
struct ActiveSubscriptionModel: Codable {
    let currentPackage: CurrentSubscriptionPackage?
    let invoiceHistory: [CurrentSubscriptionPackage]
}

// MARK: - CurrentSubscriptionPackage
struct CurrentSubscriptionPackage: Codable {
    let id: String
    let packageID: String?
    let packageName: String?
    let packageColor: String?
    let code: String?
    var status: String?
    let expiryDate: String?
    let limit: Int?
    let price: Double?
    let creationDate: String?
    let paymentMethod: PaymentCardModel

    enum CodingKeys: String, CodingKey {
        case id
        case packageID = "packageId"
        case packageName, packageColor, code, status, expiryDate, limit, price, creationDate, paymentMethod
    }
}
