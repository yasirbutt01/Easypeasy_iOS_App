//
//  SubscribeRequestModel.swift
//  easypeasy
//
//  Created by EXIA on 16/10/2020.
//

import Foundation

// MARK: - SubscribeRequestModel
struct SubscribeRequestModel: Codable {
    let packageID, paymentMethodID: String

    enum CodingKeys: String, CodingKey {
        case packageID = "packageId"
        case paymentMethodID = "paymentMethodId"
    }
}
