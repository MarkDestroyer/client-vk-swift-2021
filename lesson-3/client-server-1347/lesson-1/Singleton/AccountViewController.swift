//
//  ViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 05.07.2021.
//

import UIKit

final class Account {
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
    
}

class AccountViewController: UIViewController {

    lazy var accountService = Account.shared
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func sendCashAction(_ sender: Any) {
        
        //Ранний выход + разворачиваем опционал
        guard let cashString = sumTextField.text,
              let cash = Int(cashString),
              let name = nameTextField.text
        else {
            //Alert
            return }
        
        Account.shared.name = name
        Account.shared.cash = cash
        
    }
    
}

