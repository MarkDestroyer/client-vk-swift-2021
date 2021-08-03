//
//  WallApi.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON



final class WallApi {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    //DynamicJSON
    func getWallInfo(completion: @escaping([Wall])->()) {
        
        let method = "/wall.get"
        
        let parameters: Parameters = [
            "access_token": token,
            "owner_id": cliendId,
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
            
           let wall = items.map { Wall(json: $0)}
            
           completion(wall)
            
        }
    }
}


