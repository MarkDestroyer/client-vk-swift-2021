//
//  FriendsDB.swift
//  client-server-1347
//
//  Created by Марк Киричко on 24.07.2021.
//

import Foundation
import RealmSwift

protocol FriendsDBProtocol {
    
    func add(_ user: User3)
    func read() -> [User3]
    func delete(_ user: User3)
}

class FriendDB: FriendsDBProtocol {
    
    let config = Realm.Configuration(schemaVersion: 3)
    lazy var mainRealm = try! Realm(configuration: config)
    
    func add(_ user: User3) {
        
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
    
    func read() -> [User3] {
        
            let users = mainRealm.objects(User3.self)
            
            users.forEach { print($0.firstName, $0.lastName, $0.id) }
        
            print(mainRealm.configuration.fileURL)
            
            return Array(users)
        
    }
    
    func delete(_ user: User3) {
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



