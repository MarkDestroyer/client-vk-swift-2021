//
//  FruitListViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 05.07.2021.
//

import UIKit

protocol FruitListViewControllerDelegate: AnyObject {
    func fruitDidSelect(fruit: String)
    
    //func fruitDidSelect(completion: (String)->())
}

class FruitListViewController: UITableViewController {

    weak var delegate: FruitListViewControllerDelegate?
    
    let fruits = ["Авокадо", "Яблоко", "Персик", "Банан"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fruit = fruits[indexPath.row]
        
        delegate?.fruitDidSelect(fruit: fruit)
        
        //delegate?.fruitDidSelect(completion: fruit)
        
        navigationController?.popViewController(animated: true)
    }


}
