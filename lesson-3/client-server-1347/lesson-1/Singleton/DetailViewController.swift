//
//  DetailViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 05.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        nameLabel.text = Account.shared.name
        sumLabel.text = "\(Account.shared.cash)"
    }
    


}
