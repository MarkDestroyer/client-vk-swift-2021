//
//  GroupsTableViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//

import UIKit
import RealmSwift

class GroupsViewController: UITableViewController {

    let groupAPI = GroupAPI()
    let groupDB = GroupDB()
    var groups: Array<GroupModel> = [GroupModel]()
    
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(GroupModel.self)
            
            self.groups = Array(userinfo)
             
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroupInfo  { [weak self] group in
            
            guard let self = self else { return }
            
            self.loadData()
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

      
        
        //cell.configure(groups[indexPath.row])
        cell.loadData(groups[indexPath.row])

        return cell
    }
}

