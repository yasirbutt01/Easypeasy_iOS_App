//
//  GetPaymentMethodsModel.swift
//  easypeasy
//
//  Created by EXIA on 15/10/2020.
//

import Foundation

// MARK: - GetPaymentMethodsResponseModel
struct GetPaymentMethodsResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: PaymentMethodModel
}

// MARK: - PaymentMethodModel
struct PaymentMethodModel: Codable {
    let paymentMethods: [PaymentCardModel]
}

// MARK: - PaymentCardModel
struct PaymentCardModel: Codable {
    let id: String
    let paymentMethodType: Int
    let cardType: String?
    let cardMaskedCardNumber: String?
    let creationDate: String?
    let expiryDate: String?
    let paypalEmail: String?
    let isDefault: Bool
    let paymentMethodImageUrl:String?
}
