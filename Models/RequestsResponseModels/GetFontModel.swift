//
//  GetFontModel.swift
//  easypeasy
//
//  Created by Ahmad on 12/10/2020.
//

import Foundation

// MARK: - GetFontResponseModel
struct GetFontResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: [FontModel]
}

// MARK: - Datum
struct FontModel: Codable {
    let id: Int
    let name: String
}

