//
//  HomeViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/11/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var notificationCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getNotifications()
        notificationCount.layer.cornerRadius = 10
        notificationCount.layer.masksToBounds = true
        
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGestureRecognizer)
   

        
        
        let colors1 = [#colorLiteral(red: 0.03529411765, green: 0.662745098, blue: 0.3725490196, alpha: 1), #colorLiteral(red: 0, green: 0.3764705882, blue: 0.2196078431, alpha: 1)]
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 180)
        gradientLayer1.colors = colors1.map({$0.cgColor})
        gradientLayer1.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer1.type = .radial
        gradientLayer1.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer1, at: 0)
        
        
        infoView.layer.cornerRadius = 15
        infoView.addShadow(offset: CGSize(width: 0, height: 3), color: #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4), radius: 6.5, opacity: 0.4)

        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
   
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell2
       
        cell.selectionStyle = .none
        return cell
       }
       

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func getNotifications() {
        AF.request("https://api.tapon.am/api/notification/getUnseenNotificationsCount", method: .get, headers: ["Authorization": "Bearer \(AccountManager.shared.loggedUserToken())", "osTypeId": "2"]) .responseJSON { (response) in
            do {
                let a = try JSONDecoder().decode(NotificationResponse.self, from: response.data!)
                self.notificationCount.text = String(a.data)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
