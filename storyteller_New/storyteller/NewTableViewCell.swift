//
//  NewTableViewCell.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/29/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    //https://www.youtube.com/watch?v=zAWO9rldyUE
    
    @IBOutlet var username: UILabel!
    @IBOutlet var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}//general
