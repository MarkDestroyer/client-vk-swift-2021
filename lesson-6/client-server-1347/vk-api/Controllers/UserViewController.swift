//
//  FriendsViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import UIKit
import RealmSwift

class UserProfileViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var bd: UILabel!
    
    let userApi = UserAPI()
    var user: Array<Profile> = [Profile]()
    let personDB = PersonDB()
    
    func loadData() {
            do {
                let realm = try Realm()
                
                let userinfo = realm.objects(Profile.self)
                
                self.user = Array(userinfo)
                
                for person in user {
                    var firstname = person.firstName
                    var lastname = person.lastName
                    var fullname = ("\(firstname) \(lastname)")
                    var town = person.home_town
                    var birthday = person.bdate
                    nameLabel.text = fullname
                    townLabel.text = town
                    bd.text = birthday
                }
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            
                self.loadData()
                self.personDB.read()
            }
        }
    }

