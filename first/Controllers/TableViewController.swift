//
//  TableViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/9/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var profileImages = ["NoPath - Copy (7)", "NoPath - Copy (9)", "NoPath - Copy (10)", "NoPath - Copy (11)", "NoPath", "NoPath - Copy (7)", "NoPath - Copy (13)", "NoPath - Copy (14)", "ic_no_profile_photo"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Path 1452"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Group 1648"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        
        navigationController?.navigationBar.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        navigationController?.navigationBar.layer.shadowRadius = 4.0
        navigationController?.navigationBar.layer.shadowOpacity = 0.5
        navigationController?.navigationBar.layer.masksToBounds = false
       
    }
    @objc func leftBarButtonTapped() {
        print("l")
    }
 
    @objc func rightBarButtonTapped() {
        print("r")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profileImages.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
     
        let profileImageView = UIImageView(frame: CGRect(x: 146, y: 91, width: 83, height: 83))
        profileImageView.image = UIImage(named: "NoPath - Copy (11)")
        let layer = CALayer()
        layer.frame = profileImageView.bounds
       
      
   
        layer.opacity = 1
        layer.cornerRadius = 41.5
        layer.borderWidth = 5.0
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) 
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3.0
        profileImageView.layer.insertSublayer(layer, at: 0)
        headerView.addSubview(profileImageView)
        
        
        
        
        let nameLabel = UILabel(frame: CGRect(x: 136, y: 191, width: 110, height: 21))
        nameLabel.text = "Adam Smith"
        nameLabel.font = UIFont(name: "AvenirNext-Bold", size: 18.0)
        headerView.addSubview(nameLabel)
     
        
        let achievmentsLabel = UILabel(frame: CGRect(x: 17, y: 240, width: 160, height: 24))
        achievmentsLabel.text = "My Achievments"
        achievmentsLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
        headerView.addSubview(achievmentsLabel)
        
        let progressBar = UIView(frame: CGRect(x: 17.5, y: 282.5, width: 340, height: 5))
        progressBar.backgroundColor = hexStringToUIColor(hex: "#DFDFDF")
        let progressBarCompleted = UIView(frame: CGRect(x: 17.5, y: 282.5, width: 233, height: 5))
        progressBarCompleted.backgroundColor = hexStringToUIColor(hex: "#2FA763")
        headerView.addSubview(progressBar)
        headerView.addSubview(progressBarCompleted)
        
       
        
        let leftLabel = UILabel(frame: CGRect(x: 17, y: 297, width: 186, height: 17))
        leftLabel.font = UIFont(name: "AvenirNext-Bold", size: 14)
        leftLabel.text = "37% left to reach next level"
        headerView.addSubview(leftLabel)
        
        
        //stack view 1
        
        let image1 = UIImageView(image: UIImage(named: "Group 1601"))
        let image2 = UIImageView(image: UIImage(named: "Group 1489"))
        let image3 = UIImageView(image: UIImage(named: "Group 1492"))
        let image4 = UIImageView(image: UIImage(named: "Group 1495"))
        
        
        let stackVIew1 = UIStackView()
        stackVIew1.axis = .horizontal
        stackVIew1.distribution = .fillEqually
        stackVIew1.spacing = 10
        stackVIew1.alignment = .center
        stackVIew1.frame = CGRect(x: 0, y: 344, width: 375, height: 80.83)
        stackVIew1.addArrangedSubview(image1)
        stackVIew1.addArrangedSubview(image2)
        stackVIew1.addArrangedSubview(image3)
        stackVIew1.addArrangedSubview(image4)
        headerView.addSubview(stackVIew1)
        
        //stack view 2
        let title1 = UILabel()
        title1.textAlignment = .center
        title1.text = "Citizen"
        let title2 = UILabel()
        title2.textAlignment = .center
        title2.text = "Master"
        let title3 = UILabel()
        title3.textAlignment = .center
        title3.text = "Genius"
        let title4 = UILabel()
        title4.textAlignment = .center
        title4.text = "Hero"
        let stackVIew2 = UIStackView()
        stackVIew2.axis = .horizontal
        stackVIew2.distribution = .fillEqually
        stackVIew2.spacing = 10
        stackVIew2.alignment = .center
        stackVIew2.frame = CGRect(x: 0, y: 410, width: 375, height: 20.83)
        stackVIew2.addArrangedSubview(title1)
        stackVIew2.addArrangedSubview(title2)
        stackVIew2.addArrangedSubview(title3)
        stackVIew2.addArrangedSubview(title4)
        headerView.addSubview(stackVIew2)
        
        let topSellersLabel = UILabel(frame: CGRect(x: 17, y: 460, width: 100, height: 24))
        topSellersLabel.textAlignment = .left
        topSellersLabel.text = "Top Sellers"
        topSellersLabel.font = UIFont(name: "AvenirNext-Bold", size: 18.0)
        headerView.addSubview(topSellersLabel)
        
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500 
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
 
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.pointsLabel.text = "points"
        cell.profileImageVIew.image = UIImage(named: profileImages[indexPath.row])
//        cell.selectionStyle = .none
        
        if indexPath.row != profileImages.count - 1 {
            cell.nameLabel.text = "Adam Smith"
            cell.scoreLabel.text = "3542"
            cell.orderLabel.text = String(indexPath.row + 1)
            
        } else {
            cell.nameLabel.text = "-"
            cell.scoreLabel.text = "-"
            cell.orderLabel.text = "-"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
  
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}
