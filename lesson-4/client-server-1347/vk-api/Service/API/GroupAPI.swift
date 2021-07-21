//  GroupAPI.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON



final class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getGroupInfo(completion: @escaping([GroupProfile])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "group_id": cliendId,
            "extended": "1",
            "fields": "photo_50",
            "count": "45",
            "v": version,
        ]
       
        
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)
            
            guard let items = JSON(data).response.items.array else { return }
            
           let group = items.map { GroupProfile(json: $0)}
            
           completion(group)
            
        }
    }
}

