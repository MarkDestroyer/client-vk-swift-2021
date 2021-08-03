//
//  Photo.swift
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
    var photo_50: String = ""
    var firstName: String = ""

    
    
    init(json: JSON) {
        self.id = json.id.int ?? 0 //json["id"] as! Int
        self.firstName = json.first_name.string ?? "" //json["first_name"] as! String
        self.lastName = json.last_name.string ?? "" //json["last_name"] as! String
        self.photo_50 = json.photo_50.string ?? ""
    }
}
