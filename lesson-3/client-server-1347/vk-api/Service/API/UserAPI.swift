//
//  API.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

class UserProfile {

    let firstName: String?

    init(json: JSON) {
        self.firstName = json.dictionary?["response"]?.string //json["first_name"] as! String
    }
}

struct UserResponse2: Codable {
    let response: [Response55]
}

// MARK: - Response
struct Response55: Codable {
    let id: Int
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool
    let photo50: String
    let verified: Int

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo50 = "photo_50"
        case verified
    }
}




final class UserAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.31"
    
    //DynamicJSON
    func getUserInfo(completion: @escaping(String)->()) {
        
        let method = "/users.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "user_id": cliendId,
            "fields": "first_name, last_name",
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
        
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)

            var user = JSON(data).dictionary!["response"]!.array?[0]
                .dictionary!["first_name"]!.string!
            
            user = user! + " "
            
            user = user! + (JSON(data).dictionary!["response"]!.array?[0].dictionary!["last_name"]!.string!)! + " " + "ID пользователя: " +  (JSON(data).dictionary!["response"]!.array?[0].dictionary!["id"]!.string!)!
            completion(user!)
            
    
            
            
        }
    }
}
