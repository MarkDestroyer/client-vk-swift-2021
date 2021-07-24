//
//  ProfileDB.swift
//  client-server-1347
//
//  Created by Марк Киричко on 24.07.2021.
//

import Foundation
import RealmSwift

protocol PersonDBProtocol {
    
    func add(_ user: Profile)
    func read() -> [Profile]
    func delete(_ user: Profile)
}

class PersonDB: PersonDBProtocol {
    
    let config = Realm.Configuration(schemaVersion: 3)
    lazy var mainRealm = try! Realm(configuration: config)
    
    func add(_ user: Profile) {
        
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
    
    func read() -> [Profile] {
        
            let users = mainRealm.objects(Profile.self)
            
            users.forEach { print($0.firstName, $0.lastName, $0.id) }
        
            print(mainRealm.configuration.fileURL)
            
            return Array(users)
        
    }
    
    func delete(_ user: Profile) {
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


