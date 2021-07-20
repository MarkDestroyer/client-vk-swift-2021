//
//  Group.swift
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
    var photo_50: String = ""
    
    init(json:JSON) {
        groupId = json.id.int ?? 0
        name = json.name.string ?? ""
        photo_50 = json.photo_50.string ?? ""
    }
}
