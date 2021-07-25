//
//  FriendsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    let friendsAPI = FriendsAPI()
    var friends: [User3] = []
    let friendDB = FriendDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        friendsAPI.getFriends3  { [weak self] users in
            
            guard let self = self else { return }
            
            self.friends = users
            self.friendDB.loadData()
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

      
        
        cell.configure(friends[indexPath.row])
        
        

        return cell
    }
}

