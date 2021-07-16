//
//  User1.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import Foundation

// MARK: - Friends
struct User: Codable {
    let response: UserResponse
}

// MARK: - Response
struct UserResponse: Codable {
    let count: Int
    let items: [User1]
}

// MARK: - Item
struct User1: Codable {
    let id: Int
    let lastName: String
    let photo50: String
    let trackCode, firstName: String
    let photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
