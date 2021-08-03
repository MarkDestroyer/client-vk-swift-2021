//
//  WallCollectionViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 22.07.2021.
//

import UIKit

class WallCollectionViewCell: UITableViewCell {

    static let identifier = "WallCollectionViewCell"

    @IBOutlet weak var groupImage: UIImageView!
    
    @IBOutlet weak var groupName: UILabel!
    
    func configure(_ group: GroupProfile)  {
        groupName?.text = "\(group.name)"
        
        
        DispatchQueue.global().async {
            guard let url = URL(string: group.photo_max) else {return}
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.groupImage!.image = UIImage(data: data)
                    self.groupImage.layer.cornerRadius = 50;
                    self.groupImage.clipsToBounds = true
                    self.groupImage.layer.borderWidth = 5
                    self.groupImage.layer.borderColor = UIColor.black.cgColor
                }
            }

        }
    }
}
