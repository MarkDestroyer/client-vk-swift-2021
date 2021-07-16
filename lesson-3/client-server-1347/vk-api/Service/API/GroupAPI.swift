//  GroupAPI.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

class GroupProfile {
    let id: Int?
    let screenName: String?
    
    init(json: JSON) {
        self.id = json.number?.intValue
        self.screenName = json.screen_name.string
    }
}

final class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getGroupInfo(groupId:String, completion: @escaping([GroupProfile])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
                          "group_id": groupId,
                          "fields": "crop_photo,screen_name,city,members_count,site",
                          "v": version]
        
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

