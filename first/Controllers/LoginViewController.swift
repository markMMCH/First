//
//  LoginViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/10/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        if AccountManager.shared.isUserLoggedIN() {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        setupUI()
        addGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    func setupUI() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
//        loginTextField.attributedPlaceholder = NSAttributedString(string: "+374",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 30, height: loginTextField.frame.height))
        loginTextField.layer.cornerRadius = 15
        loginTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.masksToBounds = true
        signInButton.layer.cornerRadius = 15
        signInButton.layer.masksToBounds = true
        loginTextField.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginTextField.layer.shadowRadius = 6
        loginTextField.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        loginTextField.layer.shadowPath = shadowPath.cgPath
        passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 3)
        passwordTextField.layer.shadowRadius = 20
        passwordTextField.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        passwordTextField.layer.shadowPath = shadowPath.cgPath
    
        
    }
    
    func addGradient() {
        let layer = CAGradientLayer()
        layer.colors = [#colorLiteral(red: 0, green: 0.3764705882, blue: 0.2196078431, alpha: 1).cgColor, #colorLiteral(red: 0.03529411765, green: 0.662745098, blue: 0.3725490196, alpha: 1).cgColor,#colorLiteral(red: 0, green: 0.3764705882, blue: 0.2196078431, alpha: 1).cgColor, #colorLiteral(red: 0.03529411765, green: 0.662745098, blue: 0.3725490196, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        layer.locations = [0, 1]
        layer.frame = view.bounds
        view.layer.insertSublayer(layer, at: 0)
    
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            textField.text = "+374 "
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        return true
    }
    @IBAction func signInTapped(_ sender: Any) {
        
        if (loginTextField.text == "+374 95807672" || loginTextField.text == "+3749580767") && passwordTextField.text == "asdasd" {
            
            let user = User(password: "asdasd", phoneNumber: "+37495807672")
            AF.request("https://api.tapon.am/api/auth/signIn", method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: ["OsTypeId": "2", "LanguageName": "en", "DeviceId": "fsdgsd", "Model": "6s", "DeviceToken": "efsef"]).responseJSON { (response) in
             
                if response.error == nil {
                    if let value = response.value as? [String: Any] {
                        if let token = value["data"] as? [String: String] {

                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                            AccountManager.shared.setCurrentToken(token: token["token"]!)
                        }
                    }
                } else {
                    // ....
                }
            }
        } else {
            showAlert()
        }
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Incorrect number or password", message: nil, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //let action2 = UIAlertAction(title: "Female", style: .cancel, handler: nil)
        
        alert.addAction(action1)
        //alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    
}




