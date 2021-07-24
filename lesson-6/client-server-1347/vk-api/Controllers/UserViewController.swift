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
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var bd: UILabel!
    
    let userApi = UserAPI()
    var user: Profile? = nil
    let personDB = PersonDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userApi.getUserInfo {[weak self] user in guard let self = self else { return }
            self.user = user
            self.nameLabel?.text = "\(user.firstName) \(user.lastName)"
            self.townLabel?.text = user.home_town
            self.bd?.text = "Дата рождения: \(user.bdate)"
            
            DispatchQueue.global().async {
                guard let url = URL(string: user.photo_max) else {return}
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                        self.imageView.layer.cornerRadius = 75;
                        self.imageView.clipsToBounds = true
                        self.imageView.layer.borderWidth = 5
                        self.imageView.layer.borderColor = UIColor.black.cgColor
                        
                    }
                }
            }
        
            DispatchQueue.main.async {
                
                self.personDB.add(user)
                
                let _ = self.personDB.read()
                
               
                //self.personDB.delete(person2)
                
                //let _ = self.personDB.read()
                
            }

        }
    }
}
