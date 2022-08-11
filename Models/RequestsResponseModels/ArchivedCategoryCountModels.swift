//
//  ArchivedCategoryCountModels.swift
//  easypeasy
//
//  Created by Ahmad on 20/10/2020.
//

import Foundation

// MARK: - ArchivedCategoryCountModels
struct GetArchivedCategoryCountResponseModels: Codable {
    let isError: Bool
    let messages: String
    let data: [ArchiveCardCategoryModel]?
}

// MARK: - Datum
struct ArchiveCardCategoryModel: Codable {
    let categoryID, category: String
    let archivedCount: Int

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case category, archivedCount
    }
}
