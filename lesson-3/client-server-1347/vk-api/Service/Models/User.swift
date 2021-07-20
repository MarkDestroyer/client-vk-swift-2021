//
//  User1.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON

struct Profile {
    
    var id: Int = 0
    var lastName: String = ""
    var firstName: String = ""
    var photo_50: String = ""
    
    init(json: JSON) {
        self.id = json.id.int ?? 0 //json["id"] as! Int
        self.firstName = json.first_name.string ?? "" //json["first_name"] as! String
        self.lastName = json.last_name.string ?? ""  //json["last_name"] as! String
        self.photo_50 = json.photo_50.string ?? ""
    }
}
