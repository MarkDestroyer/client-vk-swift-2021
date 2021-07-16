//
//  NotificationCenterViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 05.07.2021.
//

import UIKit

let backgroundChangeColorNotification = Notification.Name("backgroundChangeColorNotification")

class NotificationCenterViewController: UIViewController {

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Подписали контроллер self - на нотификацию backgroundChangeColorNotification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeColor(notification:)),
                                               name: backgroundChangeColorNotification,
                                               object: nil)

    }
    
    deinit {
        //Отписать контроллер self - от нотификации backgroundChangeColorNotification
        NotificationCenter.default.removeObserver(self, name: backgroundChangeColorNotification, object: nil)
    }
    
    //MARK: - Private
    
    @objc
    private func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor = color
    }
    
    // MARK: - Actions
    @IBAction func changeColorAction(_ sender: Any) {
        
        let color = UIColor.yellow
        NotificationCenter.default.post(name: backgroundChangeColorNotification, object: nil, userInfo: ["color": color])
        
    }
    
   
    

}
