//
//  CustomCell.swift
//  first
//
//  Created by Mark Chibukhchian on 3/9/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var profileImageVIew: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
