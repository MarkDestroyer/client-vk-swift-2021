//
//  File.swift
//  client-server-1347
//
//  Created by Марк Киричко on 14.07.2021.
//

import UIKit

class GroupViewController: UITableViewController {

    let groupApi = GroupAPI()
    
    var group: [GroupProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupApi.getGroupInfo(groupId: "30022666")  {
            [weak self] group in guard let self = self else { return }
            
            self.group = group
            self.tableView.reloadData()
            print(group)
        
            
        }
  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let group: GroupProfile = group[indexPath.row]
        
        cell.textLabel?.text = "\(String(group.id!)) "
                
        return cell
    }
}

