//
//  GroupsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit

class GroupsViewController: UITableViewController {

    let groupAPI = GroupAPI()
    let groupDB = GroupDB()
    var groups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroupInfo  { [weak self] group in
            
            guard let self = self else { return }
            
            
            self.tableView.reloadData()
            print(group)
        }
  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier, for: indexPath) as! GroupsTableViewCell

      
        
        cell.configure(groups[indexPath.row])
        cell.loadData()

        return cell
    }
}

