//
//  GroupsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit

class GroupsViewController: UITableViewController {

    let groupAPI = GroupAPI()
    
    var groups: [GroupProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroupInfo  { [weak self] users in
            
            guard let self = self else { return }
            
            self.groups = users
            self.tableView.reloadData()
            print(users)
        }
  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let group: GroupProfile = groups[indexPath.row]
        
        cell.textLabel?.text = "\(group.name)"
        
        
        DispatchQueue.global().async {
            guard let url = URL(string: group.photo_50) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.imageView!.image = UIImage(data: data)
                }
                
              
            }
        }

        return cell
    }
}

