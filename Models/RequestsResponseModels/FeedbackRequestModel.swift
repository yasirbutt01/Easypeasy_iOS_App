//
//  FeedbackRequestModel.swift
//  easypeasy
//
//  Created by EXIA on 19/10/2020.
//

import Foundation

// MARK: - FeedbackRequestModel
struct FeedbackRequestModel: Codable {
    let text: String
    let rating: Int
    let appVersion, apiVersion: String
    let osType: Int
}
