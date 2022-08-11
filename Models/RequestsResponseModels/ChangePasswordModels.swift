//
//  ChangePasswordModels.swift
//  easypeasy
//
//  Created by EXIA on 07/10/2020.
//

import Foundation

// MARK: - UpdatePasswordRequestModel
struct UpdatePasswordRequestModel: Codable {
    let oldPassword, newPassword: String
}
