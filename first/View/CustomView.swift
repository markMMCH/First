//
//  CustomView.swift
//  first
//
//  Created by Mark Chibukhchian on 3/9/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
    
    

   func setupView() {
    
    backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.6549019608, blue: 0.3882352941, alpha: 1)
    layer.cornerRadius = 15
    
    
    let orderLabel = UILabel()
    orderLabel.text = "159"
    orderLabel.textColor = .white
    orderLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(orderLabel)
    
    orderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    orderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
    orderLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
    orderLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    
    let profileImageView = UIImageView()
    profileImageView.image = UIImage(named: "NoPath - Copy (11)")
    profileImageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(profileImageView)
    
    profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 46).isActive = true
    profileImageView.widthAnchor.constraint(equalToConstant: 31).isActive = true
    profileImageView.heightAnchor.constraint(equalToConstant: 31).isActive = true
    
    let nameLabel = UILabel()
    nameLabel.text = "Adam Smith"
    nameLabel.textColor = .white
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(nameLabel)
    
    nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 86).isActive = true
    nameLabel.widthAnchor.constraint(equalToConstant: 99).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    
    
    let scoreLabel = UILabel()
    scoreLabel.text = "3542"
    scoreLabel.textColor = .white
    scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(scoreLabel)
    
    scoreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
    scoreLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
    scoreLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    scoreLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    
    let pointsLabel = UILabel()
    pointsLabel.text = "points"
    pointsLabel.textColor = .white
    pointsLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(pointsLabel)
    
    
    pointsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    pointsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
    pointsLabel.widthAnchor.constraint(equalToConstant: 57).isActive = true
    pointsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    
  }
}


class RoundShadowView: UIView {

    let containerView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutView() {

        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -8.0)
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 10.0
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true

        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // pin the containerView to the edges to the view
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
