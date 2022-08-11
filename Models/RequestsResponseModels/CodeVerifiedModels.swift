//
//  CodeVerifiedModels.swift
//  easypeasy
//
//  Created by EXIA on 07/10/2020.
//

import Foundation

// MARK: - CodeVerifiedModel
struct CodeVerifiedRequestModel: Codable {
    let phoneNumber, code: String
    let isChangingPhone: Bool
}
