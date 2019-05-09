//
//  OrderCellTableViewCell.swift
//  Flykeart App
//
//  Created by Federico Brandt on 4/27/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import UIKit

class OrderCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameInOrder: UILabel!
    @IBOutlet weak var seatInOrder: UILabel!
    @IBOutlet weak var drinkInOrder: UILabel!
    @IBOutlet weak var snackInOrder: UILabel!
    
    
    @IBOutlet weak var serveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
