//
//  FriendsViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    let userApi = UserAPI()
    var user : String? = nil
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://sun9-73.userapi.com/impg/Bk3AB70wnbEkrRo6W5eFKlAM3aMJ9QdqFcJjng/JEa5xTjc3aI.jpg?size=1620x2160&quality=96&sign=73c52aa02b488f595af638c784a95b14&type=album")!
       
        
        
        if let data = try? Data(contentsOf: url) {
           
            imageView.image = UIImage(data: data)
            
            
            userApi.getUserInfo {user in
                self.user = user
                self.nameLabel?.text = "\(user)"
                self.idLabel?.text = "\(user)"
            }
        }
    }
}
