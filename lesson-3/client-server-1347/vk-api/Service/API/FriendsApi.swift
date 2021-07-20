//
//  PhotoApi.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

struct User3 {
    
    var id: Int = 0
    var lastName: String = ""
    var photo50: String = ""
    var firstName: String = ""
    var photo: String = ""
    
    
    init(json: JSON) {
        self.id = json.id.int ?? 0 //json["id"] as! Int
        self.firstName = json.first_name.string ?? "" //json["first_name"] as! String
        self.lastName = json.last_name.string ?? "" //json["last_name"] as! String
        self.photo = json.photos.array?.first!.photo_50.string ?? ""
    }
}



final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getFriends3(completion: @escaping([User3])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "order": "hints",
            "fields": "photo_50",
            "v": version,
            "user_id": cliendId]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in

            guard let data = response.data else { return }
            print(data.prettyJSON as Any)

            guard let items = JSON(data).response.items.array else { return }
            
            let friends = items.map { User3(json: $0)}
            completion(friends)
            
        }
    }
}
