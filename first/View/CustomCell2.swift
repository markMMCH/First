//
//  CustomCell2.swift
//  first
//
//  Created by Mark Chibukhchian on 3/11/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {
    
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var seperatorView: UIView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var kgLabel: UILabel!
    @IBOutlet var kgsLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var backVIew: UIView!
    
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupElements()
        setupConstraints()
     
    }
    
    
    func setupConstraints() {
       
        orderLabel.topAnchor.constraint(equalTo: backVIew.topAnchor, constant: 14).isActive = true
        orderLabel.leftAnchor.constraint(equalTo: backVIew.leftAnchor, constant: 11).isActive = true
        orderLabel.widthAnchor.constraint(equalToConstant: 64).isActive = true
        orderLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 10.7).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: backVIew.leftAnchor, constant: 11).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 14.36).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 11.46).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8.54).isActive = true
        addressLabel.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 10.48).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 46).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 205).isActive = true
        
        kgLabel.topAnchor.constraint(equalTo: backVIew.topAnchor, constant: 7).isActive = true
        kgLabel.rightAnchor.constraint(equalTo: backVIew.rightAnchor, constant: -13).isActive = true
        kgLabel.widthAnchor.constraint(equalToConstant: 69).isActive = true
        kgLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        kgsLabel.leftAnchor.constraint(equalTo: kgLabel.rightAnchor, constant: -10).isActive = true
        kgsLabel.bottomAnchor.constraint(equalTo: kgLabel.bottomAnchor).isActive = true
        kgsLabel.widthAnchor.constraint(equalToConstant: 69).isActive = true
        kgsLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        moneyLabel.topAnchor.constraint(equalTo: kgLabel.bottomAnchor, constant: 6).isActive = true
        moneyLabel.rightAnchor.constraint(equalTo: backVIew.rightAnchor, constant: -2).isActive = true
        moneyLabel.widthAnchor.constraint(equalToConstant: 113).isActive = true
        moneyLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: backVIew.rightAnchor, constant: -10).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: backVIew.leftAnchor, constant: 15).isActive = true
        seperatorView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5.33).isActive = true
        seperatorView.bottomAnchor.constraint(equalTo: stateLabel.topAnchor, constant: -4).isActive = true
        
        
        stateLabel.bottomAnchor.constraint(equalTo: backVIew.bottomAnchor, constant: -7.65).isActive = true
        stateLabel.leftAnchor.constraint(equalTo: backVIew.leftAnchor, constant: 11).isActive = true
        stateLabel.widthAnchor.constraint(equalToConstant: 61).isActive = true
        stateLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        dateLabel.bottomAnchor.constraint(equalTo: backVIew.bottomAnchor, constant: -7.65).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: backVIew.rightAnchor, constant: -9).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 145).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        
            
    }
    
    func setupElements() {
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        kgLabel.translatesAutoresizingMaskIntoConstraints = false
       
        kgsLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        orderLabel.font = UIFont.init(name: "Nunito-Regular", size: 13)
        orderLabel.textColor = #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        orderLabel.text = "№ 125871"
        
        kgLabel.font = UIFont.init(name: "Nunito-Bold", size: 25)
        kgLabel.textColor = #colorLiteral(red: 0.6039215686, green: 0.5254901961, blue: 0.3490196078, alpha: 1)
        kgLabel.text = "~12"
        kgLabel.textAlignment = .center
        
        
        kgsLabel.font = UIFont.init(name: "Nunito-Regular", size: 16)
        kgsLabel.textColor = #colorLiteral(red: 0.6039215686, green: 0.5254901961, blue: 0.3490196078, alpha: 1)
        kgsLabel.textAlignment = .left

        
        
        iconImageView.image = UIImage(named: "placeholder (8)")
        
        
        addressLabel.text = "15 Arshakynyac ave, Yerevan, 3 entrance, 5 floor"
        addressLabel.font = UIFont.init(name: "Nunito-Regular", size: 16)
        
        moneyLabel.text = "120.00 $"
        moneyLabel.font = UIFont.init(name: "Nunito-Bold", size: 25)
        
        stateLabel.text = "Pending"
        stateLabel.font = UIFont.init(name: "Nunito-Regular", size: 16)
        stateLabel.alpha = 0.4
        
        
        dateLabel.text = "25 Nov 2019 20:54"
        dateLabel.font = UIFont.init(name: "Nunito-Regular", size: 16)
        dateLabel.alpha = 0.4
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
        setupElements()
        setupConstraints()
    }
    
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backVIew.layer.cornerRadius = 15
        backVIew.layer.borderColor = UIColor.clear.cgColor
        backVIew.layer.masksToBounds = true
      
        
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 6.5
        layer.shadowColor = UIColor.gray.cgColor
        layer.masksToBounds = false
    }

}
