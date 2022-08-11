//
//  ChangePhoneNumberModels.swift
//  easypeasy
//
//  Created by EXIA on 08/10/2020.
//

import Foundation

// MARK: - ChangePhoneNumberRequestModel
struct ChangePhoneNumberRequestModel: Codable {
    let countryCode, phoneNumber: String
}
