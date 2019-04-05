//
//  MenuTableViewCell.swift
//  FWO Smart Motorways
//
//  Created by Hamza Janjua on 1/24/18.
//  Copyright © 2018 Frontier Works Organization. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lavel_title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    
    override func  awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
