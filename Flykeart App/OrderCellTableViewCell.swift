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
    
    func setUpCell(withInfo order : Order) {
        self.seatInOrder.text = order.getSeat()
        self.nameInOrder.text = order.getName()
        self.drinkInOrder.text = order.getDrinkChoice()
        self.snackInOrder.text = order.getSnackChoice()
        
        self.serveButton.layer.cornerRadius = 15
    }
}
