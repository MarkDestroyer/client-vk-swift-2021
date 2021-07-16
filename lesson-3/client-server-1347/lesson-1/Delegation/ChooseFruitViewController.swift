//
//  ChooseFruitViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 05.07.2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, FruitListViewControllerDelegate {
    
//    func fruitDidSelect(completion: (String) -> ()) {
//        <#code#>
//    }
    
    
    @IBOutlet weak var displayFruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func chooseFruitLabel(_ sender: Any) {
        
        let fruitListVC = FruitListViewController()
        fruitListVC.delegate = self
        navigationController?.pushViewController(fruitListVC, animated: true)
    }
    
    //MARK: - FruitListViewControllerDelegate
    
    func fruitDidSelect(fruit: String) {
        displayFruitLabel.text = fruit
    }
}
