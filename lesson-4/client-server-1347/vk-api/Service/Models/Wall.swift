//
//  Wall.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON
import RealmSwift

class Wall {
    @objc dynamic var owner_id: Int = 0
    @objc dynamic var domain: String = ""
    @objc dynamic var photo_50: String = ""
    
    convenience required init(json:JSON) {
        self.init()
        owner_id = json.id.int ?? 0
        domain = json.domain.string ?? ""
        photo_50 = json.photo_50.string ?? ""
    }
}

