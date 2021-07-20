//
//  GroupsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit

class GroupsViewController: UITableViewController {

    let groupAPI = GroupAPI()
    
    var friends: [GroupProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroupInfo  { [weak self] users in
            
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

        let group: GroupProfile = friends[indexPath.row]
        
        cell.textLabel?.text = "\(group.name)"
        
        return cell
    }
}

