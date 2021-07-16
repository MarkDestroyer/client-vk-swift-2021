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
        self.firstName = json.id.string //json["first_name"] as! String
    }
}



final class UserAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.31"
    
    //DynamicJSON
    func getUserInfo(completion: @escaping(UserProfile)->()) {
        
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
            
            
            let user = UserProfile(json: JSON(data))
            
            completion(user)
            
        }
    }
}
