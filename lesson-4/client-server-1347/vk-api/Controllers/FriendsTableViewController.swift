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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        friendsAPI.getFriends3  { [weak self] users in
            
            guard let self = self else { return }
            
            self.friends = users
            self.tableView.reloadData()
            print(users)
            
        }
  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend: User3 = friends[indexPath.row]
        
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        DispatchQueue.global().async {
            guard let url = URL(string: friend.photo_50) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.imageView!.image = UIImage(data: data)
                }
                
              
            }
        }
        
        
        return cell
    }
}

