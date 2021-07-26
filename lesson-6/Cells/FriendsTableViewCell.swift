//
//  FriendsTableViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import UIKit
import RealmSwift

final class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCell"
    var user: Array<User3> = [User3]()
    var friendDB = FriendDB()
    
    @IBOutlet  weak var FriendImage: UIImageView!
    @IBOutlet  weak var nameLabel: UILabel!
    
    
    func configure(_ friend: User3)  {
        
        
        DispatchQueue.main.async {
            guard let url = URL(string: friend.photo_max) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.FriendImage!.image = UIImage(data: data)
                    self.FriendImage.layer.cornerRadius = 50;
                    self.FriendImage.clipsToBounds = true
                    self.FriendImage.layer.borderWidth = 5
                    self.FriendImage.layer.borderColor = UIColor.black.cgColor
                    self.nameLabel?.text = "\(friend.firstName) \(friend.lastName)"
                    self.friendDB.read()
                    //self.loadData()
                }
            }
            
        }
        
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(User3.self)
            
            self.user = Array(userinfo)
            
            for person in user {
                var firstname = person.firstName
                var lastname = person.lastName
                var fullname = ("\(firstname) \(lastname)")
                nameLabel.text = fullname
            }
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
}
