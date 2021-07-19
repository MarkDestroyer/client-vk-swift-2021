//
//  RandomCode.swift
//  client-server-1347
//
//  Created by Марк Киричко on 17.07.2021.
//

//import Foundation
//import Alamofire
//
//struct PhotoItem {
//    let id, albumID, ownerID: Int
//    let width, height: Int
//    let photo75, photo130, photo604, photo807, photo1280: String?
//    let text: String?
//}
//
//AF.request(url, method: .get, parameters: params).responseData { response in
//
//            guard let data = response.data else { return }
//            guard let items = JSON(data).response.items.array else { return }
//
//            let photos = items.map {
//                PhotoItem(id: $0.id.int!,
//                          albumID: $0.album_id.int!,
//                          ownerID: $0.owner_id.int!,
//                          width: $0.width.int!,
//                          height: $0.height.int!,
//                          photo75: $0.photo_75.string!,
//                          photo130: $0.photo_130.string!,
//                          photo604: $0.photo_604.string!,
//                          photo807: $0.photo_807.string!,
//                          photo1280: $0.photo_1280.string!,
//                          text: $0.text.string!)
//            }
//
//            completion(photos)
//        }
//    }
//"items": [{
//"album_id": -7,
//"date": 1525187973,
//"id": 456316241,
//"owner_id": 1,
//"has_tags": false,
//"sizes": [{
//"height": 97,
//"url": "https://sun1-20.u...LlMU&type=album",
//"type": "m",
//"width": 130
//}, {
//"height": 98,
//"url": "https://sun1-20.u...LlMU&type=album",
//"type": "o",
//"width": 130
//}, {
//"height": 150,
//"url": "https://sun1-20.u...0PzM&type=album",
//"type": "p",
//"width": 200
//}, {
//"height": 240,
//"url": "https://sun1-20.u..._dxE&type=album",
//"type": "q",
//"width": 320
//}, {
//"height": 382,
//"url": "https://sun1-20.u..._w20&type=album",
//"type": "r",
//"width": 510
//}, {
//"height": 56,
//"url": "https://sun1-20.u...WC1g&type=album",
//"type": "s",
//"width": 75
//}, {
//"height": 453,
//"url": "https://sun1-20.u...F7to&type=album",
//"type": "x",
//"width": 604
//}, {
//"height": 605,
//"url": "https://sun1-20.u...8i7E&type=album",
//"type": "y",
//"width": 807
//}, {
//"height": 959,
//"url": "https://sun1-20.u...zfk8&type=album",
//"type": "z",
//"width": 1279
//}],


//struct Photos: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let count: Int
//    let items: [Item]
//    let more: Int
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let albumID, date, id, ownerID: Int
//    let hasTags: Bool
//    let sizes: [Size]
//    let text: String
//    let likes: Likes
//    let reposts: Reposts
//    let realOffset: Int
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case sizes, text, likes, reposts
//        case realOffset = "real_offset"
//    }
//}
//
//// MARK: - Likes
//struct Likes: Codable {
//    let userLikes, count: Int
//
//    enum CodingKeys: String, CodingKey {
//        case userLikes = "user_likes"
//        case count
//    }
//}
//
//// MARK: - Reposts
//struct Reposts: Codable {
//    let count: Int
//}
//
//// MARK: - Size
//struct Size: Codable {
//    let height: Int
//    let url: String
//    let type: String
//    let width: Int
//}


//let photosResponse = try JSONDecoder().decode(Photos.self, from: data)
//
//                let userPhotos = photosResponse.response.items
//
//                completion(userPhotos)


//struct Photos2 {
//    let id: Int
//    let sizes: [Size2]
//}
//struct Size2 {
//    let height: Int
//    let url: String
//    let type: String
//    let width: Int
//}


//let photos = items.map{
//photoItem(id: $0.id.int!, albumID: $0.album_id.int!...
//sizes: items.sizes.map{ Size2( height: $0.height.int!... }
//}


//let photos = items.map{
//                Photos2(
//                    id: $0.id.int!,
//                    sizes: $0.sizes.map{
//                        Size2(
//                            height: $0.height.int!,
//                            width: $0.width.int!,
//                            type: $0.type.string!,
//                            url: $0.url.string!)})
//            }
