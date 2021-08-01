//
//  UserFB.swift
//  client-server-1347
//
//  Created by Марк Киричко on 01.08.2021.
//

import Foundation
import Firebase

class UserFB {
    // 1
    let name: String
    let lastname: String
    let ref: DatabaseReference?
    
    init(name: String, lastname: String) {
        // 2
        self.ref = nil
        self.name = name
        self.lastname = lastname
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let lastname = value["lastname"] as? String,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.lastname = lastname
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            "lastname": lastname
        ]
    }
}



