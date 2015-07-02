//
//  ActivityTableViewCell.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 02/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var actv: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
