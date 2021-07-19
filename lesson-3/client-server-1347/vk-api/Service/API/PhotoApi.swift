//
//  PhotoApi.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

class PhotoProfile {
    
    let id: Int?
    let firstName, lastName: String?
    let photo100: String?
    
    
    init(json: JSON) {
        self.id = json.id.int //json["id"] as! Int
        self.firstName = json.first_name.string //json["first_name"] as! String
        self.lastName = json.last_name.string //json["last_name"] as! String
        self.photo100 = json.photo100.string
    }
}



final class PhotoAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getPhotoInfo(completion: @escaping([PhotoProfile])->()) {
        
        let method = "/users.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "user_id": cliendId,
            "fields": "status,city,career,counters,has_photo,crop_photo,last_seen,online",
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)
            
            guard let items = JSON(data).response.items.array else { return }
            
            let user = items.map { PhotoProfile(json: $0)}
            
            completion(user)
            
        }
    }
}

