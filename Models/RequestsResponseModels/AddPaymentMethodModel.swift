//
//  AddPaymentMethodModel.swift
//  easypeasy
//
//  Created by EXIA on 15/10/2020.
//

import Foundation

// MARK: - AddPaymentMethodRequestModel
struct AddPaymentMethodRequestModel: Codable {
    let nOnce: String
}

// MARK: - AddPaymentMethodResponseModel
struct AddPaymentMethodResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: PaymentCardModel
}
