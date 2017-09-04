//
//  Calendar_TableViewCell.swift
//  AI
//
//  Created by Philips on 03/09/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class Calendar_TableViewCell: UITableViewCell {
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var timeText: UILabel!
     @IBOutlet weak var timebar: TimeBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
