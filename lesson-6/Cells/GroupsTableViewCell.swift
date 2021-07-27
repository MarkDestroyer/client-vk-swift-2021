//
//  GroupsTableViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import UIKit
import RealmSwift

class GroupsTableViewCell: UITableViewCell {

    static let identifier = "GroupsTableViewCell"
    var group: Array<GroupModel> = [GroupModel]()
    var groupDB = GroupDB()
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    func configure(_ group: GroupModel)  {
        groupName?.text = "\(group.name)"
        
        
        DispatchQueue.main.async {
            guard let url = URL(string: group.photo_max) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.groupImage!.image = UIImage(data: data)
                    self.groupImage.layer.cornerRadius = 50;
                    self.groupImage.clipsToBounds = true
                    self.groupImage.layer.borderWidth = 5
                    self.groupImage.layer.borderColor = UIColor.black.cgColor
                    self.groupDB.read()
                }
            }

        }
        
    }
    
   
    func loadData(_ group: GroupModel) {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(GroupModel.self)
            
            self.group = Array(userinfo)
            
            groupName.text = group.name
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
}
