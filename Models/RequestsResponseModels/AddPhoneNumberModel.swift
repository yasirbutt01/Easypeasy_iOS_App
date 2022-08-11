//
//  AddPhoneNumberModel.swift
//  easypeasy
//
//  Created by EXIA on 07/10/2020.
//

import Foundation

// MARK: - AddPhoneNumberRequestModel
struct AddPhoneNumberRequestModel: Codable {
    let countryCode, phoneNumber: String
}

