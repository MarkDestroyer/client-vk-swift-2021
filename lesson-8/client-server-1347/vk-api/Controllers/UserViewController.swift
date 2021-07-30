//
//  FriendsViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 12.07.2021.
//

import UIKit
import RealmSwift
import SDWebImage

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
                    imageView.sd_setImage(with:  URL(string: person.photo_max)!)
                    self.imageView.layer.cornerRadius = 75;
                    self.imageView.clipsToBounds = true
                    self.imageView.layer.borderWidth = 5
                    self.imageView.layer.borderColor = UIColor.black.cgColor
                    let tap = UITapGestureRecognizer(target: self, action: #selector(viewOnTapped))
                    imageView.addGestureRecognizer(tap)
                    imageView.isUserInteractionEnabled = true
                }
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

    
    private func springAnimationFriends() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 1000
        animation.mass = 3
        animation.duration = 3
        animation.beginTime = CACurrentMediaTime() + 1
        imageView.layer.add(animation, forKey: nil)
    }

    @objc func viewOnTapped() {
        springAnimationFriends()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userApi.getUserInfo {[weak self] user in guard let self = self else { return }
        DispatchQueue.main.async {
                self.loadData()
                self.personDB.read()
            }
        }
    }
}
