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
   
    
    let userApi = UserAPI()
    var user: Profile? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userApi.getUserInfo {[weak self] user in guard let self = self else { return }
            self.user = user
            self.nameLabel?.text = "\(user.firstName) \(user.lastName)"
           
            
            
            DispatchQueue.global().async {
                guard let url = URL(string: user.photo_100) else {return}
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                        self.imageView.layer.cornerRadius = 100;
                        self.imageView.clipsToBounds = true
                    }
                }
            }
        }
    }
}
