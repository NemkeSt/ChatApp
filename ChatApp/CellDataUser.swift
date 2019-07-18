//
//  CellDataUser.swift
//  ChatApp
//
//  Created by Mac on 6/15/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit

class CellDataUser: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
