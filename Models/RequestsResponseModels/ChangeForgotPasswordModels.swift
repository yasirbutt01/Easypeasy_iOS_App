//
//  ChangeForgotPasswordModels.swift
//  easypeasy
//
//  Created by EXIA on 22/10/2020.
//

import Foundation

// MARK: - ChangeForgotPasswordRequestModel
struct ChangeForgotPasswordRequestModel: Codable {
    let phoneNumber, newPassword: String
}
