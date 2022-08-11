//
//  PackageModels.swift
//  easypeasy
//
//  Created by EXIA on 12/10/2020.
//

import Foundation

// MARK: - PackageResponseModel
struct PackageResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: [PackageModel]
}

// MARK: - PackageModel
struct PackageModel: Codable {
    let id, name: String
    let price: Double
    let colorCode, description, description2: String
    let durationInDays, limit: Int
    let isRecommended: Bool
    let packagePoints: [PackagePoint]

    enum CodingKeys: String, CodingKey {
        case id, name, price, colorCode
        case description = "description"
        case description2, durationInDays, limit, isRecommended, packagePoints
    }
}

// MARK: - PackagePoint
struct PackagePoint: Codable {
    let packagePointDescription, status: String

    enum CodingKeys: String, CodingKey {
        case packagePointDescription = "description"
        case status
    }
}
