//
//  WallViewController.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import UIKit

class WallViewController: UITableViewController {

    let wallAPI = WallApi()
    
    var walls: [Wall] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        wallAPI.getWallInfo  { [weak self] users in
            
            guard let self = self else { return }
            
            self.walls = users
            self.tableView.reloadData()
            print(users)
            
        }
  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walls.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let wall: Wall = walls[indexPath.row]
        
        cell.textLabel?.text = "coming soon!"
       
        
        DispatchQueue.global().async {
            guard let url = URL(string: wall.photo_50) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.imageView!.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}

