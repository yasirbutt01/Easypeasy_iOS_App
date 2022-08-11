//
//  ForgotPasswordModels.swift
//  easypeasy
//
//  Created by EXIA on 07/10/2020.
//

import Foundation

// MARK: - ForgotPasswordRequestModel
struct ForgotPasswordRequestModel: Codable {
    let countryCode, phoneNumber: String
}
