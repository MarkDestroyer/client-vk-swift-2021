//  GroupAPI.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

class GroupProfile {
    var groupId: Int = 0
    var name: String = ""
    var photo: String = ""
    
    init(json:JSON) {
        groupId = json.id.int ?? 0
        name = json.name.string ?? ""
        photo = json.photos.array?.first!.photo_50.string ?? ""
    }
}

final class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getGroupInfo(completion: @escaping([GroupProfile])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": cliendId,
            "extended": "1",
            "filter": "groups",
            "fields": "photo_100",
            "count": "20",
            "v": version,
            "access_token": Session.shared.token,
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

