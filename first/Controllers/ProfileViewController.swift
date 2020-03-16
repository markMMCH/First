//
//  ProfileViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/11/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit
import PanModal
import Alamofire
import Kingfisher
import SVProgressHUD

class ProfileViewController: UIViewController, UITextFieldDelegate {
 
    

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var dateOfBirthTextField: UITextField!
    @IBOutlet var genderTextField: UITextField!
    @IBOutlet var label1: UILabel!
    
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        indicator.color = .black
        self.view.addSubview(indicator)
        
        title = "Profile"
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Path 1452")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Path 1452")
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        navigationController?.navigationBar.layer.shadowRadius = 6.5
        
        getUserInfo()
        fullNameTextField.setLeftPaddingPoints(19)
        fullNameTextField.isUserInteractionEnabled = true
        dateOfBirthTextField.setLeftPaddingPoints(19)
        dateOfBirthTextField.isUserInteractionEnabled = false
        genderTextField.setLeftPaddingPoints(19)
        genderTextField.delegate = self
        genderTextField.addTarget(self, action: #selector(chooseGender(textField:)), for: .touchDown)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.pictureChangeTapped))
        profileImageView.addGestureRecognizer(tap)
        profileImageView.isUserInteractionEnabled = true
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
     
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
  
    
    
    @objc func pictureChangeTapped()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PanModalViewController") as! PanModalViewController
        vc.delegate = self
        presentPanModal(vc)
        vc.button1.setTitle("Change picture", for: .normal)
        vc.button2.setTitle("Delete picture", for: .normal)
    }
    
    
    @objc func chooseGender(textField: UITextField) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PanModalViewController") as! PanModalViewController
        vc.delegate = self
        presentPanModal(vc)
        vc.button1.setTitle("Male", for: .normal)
        vc.button2.setTitle("Female", for: .normal)
        
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    
    @IBAction func saveChangesTapped(_ sender: UIButton) {
        indicator.startAnimating()
        view.isUserInteractionEnabled = false
       
        let image = profileImageView.image!
        let imgData = image.jpegData(compressionQuality: 0.8)!
        
        AF.upload(multipartFormData: { (multiFormData) in
            multiFormData.append(imgData, withName: "file", fileName: "file.jpg", mimeType: "image/jpg")
        }, to: "https://api.tapon.am/api/user/uploadImage", method: .post, headers: ["Authorization": "Bearer \(AccountManager.shared.loggedUserToken())"]) .responseJSON { (response) in
            self.indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
           
        }
        AF.request("https://api.tapon.am/api/user", method: .put, parameters: ["accountTypeEnumValue": "0", "companyName": "meh", "fullName": fullNameTextField.text!, "genderEnumValue": getGender()], encoder: JSONParameterEncoder.default, headers: ["authorization": "Bearer \(AccountManager.shared.loggedUserToken())"]) .responseJSON { (response) in
        }
    
        
    }
    
 
    func getGender() -> String {
        return genderTextField.text! == "Male" ? "1" : "2"
    }
    
    func writeGender(g: Int) -> String {
        return g == 1 ? "Male" : "Female"
    }
    
    func getUserInfo() {
        AF.request("https://api.tapon.am/api/user/getUserDetails", method: .get, headers: ["Authorization": "Bearer \(AccountManager.shared.loggedUserToken())"]) .responseJSON { (response) in
            do {
                let a = try JSONDecoder().decode(UserDetails.self, from: response.data!)
                self.phoneNumberLabel.text = a.data?.phoneNumber
                self.fullNameTextField.text = a.data?.fullName
                self.genderTextField.text = self.writeGender(g: (a.data?.userGenderEnumValue)!)
                let url = URL(string: (a.data?.imageUrl)!)
                self.cameraImageView.alpha = 0
                self.coverImageView.alpha = 0
                self.profileImageView.contentMode = .scaleToFill
                self.profileImageView.layer.cornerRadius = 40
                self.profileImageView.layer.masksToBounds = true
                self.profileImageView.kf.indicatorType = .activity
                self.profileImageView.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.5))], progressBlock: nil)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}


extension ProfileViewController: ChangingProfileDelegate {
    func changeProfileImage(image: UIImage) {
        profileImageView.image = image
        coverImageView.alpha = 0
        cameraImageView.alpha = 0
    }
    
    func deleteProfileImage() {
        profileImageView.image = UIImage(named: "NoPath - Copy (11)")
        coverImageView.alpha = 1
        cameraImageView.alpha = 1
    }
    func changeGender(gender: Character) {
        genderTextField.text = gender == "m" ? "Male" : "Female"
    }
}
