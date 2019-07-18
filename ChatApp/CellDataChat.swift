//
//  CellData.swift
//  ChatApp
//
//  Created by Mac on 6/4/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit

class CellDataChat: UITableViewCell {
    
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var messageBodyTextView: UITextView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBodyTextView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
