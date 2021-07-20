//
//  FriendsTableViewCell.swift
//  client-server-1347
//
//  Created by Марк Киричко on 20.07.2021.
//
import UIKit

final class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCell"
    
    @IBOutlet weak var Friendsname: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


