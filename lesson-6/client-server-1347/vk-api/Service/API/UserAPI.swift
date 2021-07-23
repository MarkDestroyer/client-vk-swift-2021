//
//  API.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON
import RealmSwift

final class UserAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.31"
    
    // сохранение погодных данных в realm
        func saveUserData(_ info: (Profile)) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // все старые погодные данные для текущего города
                let oldUserInfo = realm.objects(Profile.self)
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // удаляем старые данные
                realm.delete(oldUserInfo)
                
    // кладем все объекты класса погоды в хранилище
                realm.add(info)
                
    // завершаем изменение хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

    
    //DynamicJSON
    func getUserInfo(completion: @escaping(Profile)->()) {
        
        let method = "/users.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "user_id": cliendId,
            "extended": "1",
            "fields": "first_name, last_name, photo_max, home_town, bdate",
            "schools": "year_to",
            "v": version]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
        
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)

            guard let items = JSON(data).response.array else { return }
            let profile = items.map { Profile(json: $0)}
            
            guard let firstUser = profile.first else {return}
            self.saveUserData(firstUser)

            completion(firstUser)
            
        }
    }
}
