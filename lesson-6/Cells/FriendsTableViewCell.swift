//
//  FriendsTableViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import UIKit

final class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCell"
    var friends: [User3] = []
    
    @IBOutlet  weak var FriendImage: UIImageView!
    @IBOutlet  weak var nameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    func configure(_ friend: User3)  {
        nameLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        
        DispatchQueue.global().async {
            guard let url = URL(string: friend.photo_max) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.FriendImage!.image = UIImage(data: data)
                    self.FriendImage.layer.cornerRadius = 50;
                    self.FriendImage.clipsToBounds = true
                    self.FriendImage.layer.borderWidth = 5
                    self.FriendImage.layer.borderColor = UIColor.black.cgColor
                }
            }
          

        }
    }
}
