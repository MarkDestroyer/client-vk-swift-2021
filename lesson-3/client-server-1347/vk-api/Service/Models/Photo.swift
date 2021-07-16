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
    let items: [PhotoVK]
}

// MARK: - Item
class PhotoVK: Codable {
    let id, albumID, ownerID: Int
    let sizes: [PhotoSize]
    let text: String
    let date: Int
    let likes: PhotoLikes
    let reposts: PhotoReposts

    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case ownerID = "owner_id"
        case sizes, text, date
        case likes, reposts
    }
}

class PhotoReposts: Codable {
    let count: Int
}

class PhotoLikes: Codable {
    let userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

class PhotoSize: Codable {
    let type: String
    let url: String
    let width, height: Int
}
