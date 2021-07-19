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

    init(json: [String: Any]) {
        self.firstName = json["first_name"] as! String
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
