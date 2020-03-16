//
//  PanModalViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/12/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit
import PanModal

class PanModalViewController: UIViewController, PanModalPresentable, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    weak var delegate: ChangingProfileDelegate?
    
    @IBOutlet var panView: UIView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        panView.layer.cornerRadius = 20
        panView.layer.masksToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        panView.addGestureRecognizer(gesture)
    }
    
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(92)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
    
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return false
    }
    
    @IBAction func buttonOneTapped(_ sender: UIButton) {
       
        if sender.titleLabel?.text == "Change picture" {
            
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
            
        } else {
            dismiss(animated: true, completion: nil)
            delegate!.changeGender(gender: "m")
        }
    }
    
    @IBAction func buttonTwoTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "Delete picture" {
            dismiss(animated: true, completion: nil)
            delegate!.deleteProfileImage()
        } else {
            dismiss(animated: true, completion: nil)
            delegate!.changeGender(gender: "f")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            dismiss(animated: true, completion: nil)
            delegate!.changeProfileImage(image: pickedImage)
        }
    }
}

protocol ChangingProfileDelegate: ProfileViewController {
    func changeProfileImage(image: UIImage)
    func deleteProfileImage()
    func changeGender(gender: Character)
}

