//
//  FriendsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit
import RealmSwift

class FriendsViewController: UITableViewController {

    let friendsAPI = FriendsAPI()
    var friends: Array<User3> = [User3]()
    let friendDB = FriendDB()
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(User3.self)
            
            self.friends = Array(userinfo)
             
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        friendsAPI.getFriends3  { [weak self] users in
            
            guard let self = self else { return }
            
           
            self.loadData()
            self.tableView.reloadData()
            print(users)
            
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as! FriendsTableViewCell

      
        
        //cell.configure(friends[indexPath.row])
        cell.loadData(friends[indexPath.row])

        return cell
    }
}

