//  GroupAPI.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import Foundation
import Alamofire
import DynamicJSON
import RealmSwift


final class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    // сохранение погодных данных в realm
        func saveGroupData(_ infoGroup: [GroupModel]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // все старые погодные данные для текущего города
                let oldGroupInfo = realm.objects(GroupModel.self)
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // удаляем старые данные
                realm.delete(oldGroupInfo)
                
    // кладем все объекты класса погоды в хранилище
                realm.add(infoGroup)
                
    // завершаем изменение хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

    //DynamicJSON
    func getGroupInfo(completion: @escaping([GroupModel])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "group_id": cliendId,
            "extended": "1",
            "fields": "photo_max",
            "count": "45",
            "v": version,
        ]
       
        
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)
            
            guard let items = JSON(data).response.items.array else { return }
            
           let group = items.map { GroupModel(json: $0)}
           self.saveGroupData(group)
           completion(group)
            
        }
    }
}

