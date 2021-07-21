//
//  GroupsTableViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 21.07.2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    static let identifier = "GroupsTableViewCell"

    @IBOutlet weak var groupImage: UIImageView!
    
    @IBOutlet weak var groupName: UILabel!
    
    func configure(_ group: GroupProfile)  {
        groupName?.text = "\(group.name)"
        
        
        DispatchQueue.global().async {
            guard let url = URL(string: group.photo_50) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.groupImage!.image = UIImage(data: data)
                }
            }
            
            self.groupImage.layer.cornerRadius = 50;
            self.groupImage.clipsToBounds = true
            
        }
    }
}
