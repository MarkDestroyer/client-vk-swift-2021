//
//  Photo.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation

// MARK: - Photo
class Photo: Codable {
    let response: PhotoResponse
}

// MARK: - Response
class PhotoResponse: Codable {
    let count: Int
    let items: [UserVK]
}

// MARK: - Item
struct UserVK: Codable {
    let id: Int
    let firstName, lastName: String
    var fullname: String { return firstName + " " + lastName }
    let isClosed, canAccessClosed: Bool?
    let photo50: String
    let online: Int
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo50 = "photo_50"
        case online
        case deactivated
    }
}
