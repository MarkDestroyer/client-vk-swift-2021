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
    //var friends: Array<User3> = [User3]()
    let friendDB = FriendDB()
    var token: NotificationToken?
    let config = Realm.Configuration(schemaVersion: 4)
    lazy var mainRealm = try! Realm(configuration: config)
    
    var friends: Results<User3>? {
        didSet {
            
            token = friends?.observe({ changes in
                
                switch changes {
                case .initial(let results):
                    print("initial", results)
                    
                    self.tableView.reloadData()
                    
                case .update(let results, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                    print("update", results)
                    
                    
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                              with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                              with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                              with: .automatic)
                    self.tableView.endUpdates()
                    
                    
                case .error(let error):
                    print("Error", error.localizedDescription)
                }
            })
        }
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(User3.self)
            
            self.friends = (userinfo)
            
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
            
            //self.friends = self.mainRealm.objects(User3.self)
            self.loadData()
            self.tableView.reloadData()
            print(users)
            
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends?.count ?? 0
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as! FriendsTableViewCell
        
        
        
        cell.loadData((friends?[indexPath.row])! )
        
        return cell
    }
    
}

