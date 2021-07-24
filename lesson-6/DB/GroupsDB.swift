//
//  GroupsDB.swift
//  client-server-1347
//
//  Created by Марк Киричко on 24.07.2021.
//

import Foundation
import RealmSwift

protocol GroupsDBProtocol {
    
    func add(_ user: GroupModel)
    func read() -> [GroupModel]
    func delete(_ user: GroupModel)
}

class GroupDB: GroupsDBProtocol {
    
    let config = Realm.Configuration(schemaVersion: 3)
    lazy var mainRealm = try! Realm(configuration: config)
    
    func add(_ user: GroupModel) {
        
        //DispatchQueue.main.async {
            do {
                self.mainRealm.beginWrite()
                self.mainRealm.add(user)
                try self.mainRealm.commitWrite()
                
            } catch {
                print(error.localizedDescription)
            }
        //}
        
    }
    
    func read() -> [GroupModel] {
        
            let users = mainRealm.objects(GroupModel.self)
            
        users.forEach { print($0.name, $0.photo_max, $0.groupId) }
        
            print(mainRealm.configuration.fileURL)
            
            return Array(users)
        
    }
    
    func delete(_ user: GroupModel) {
        //DispatchQueue.main.async {
            do {
                self.mainRealm.beginWrite()
                self.mainRealm.delete(user)
                try self.mainRealm.commitWrite()
            } catch {
                print(error.localizedDescription)
            }
        //}
        
    }
    
    
    
}




