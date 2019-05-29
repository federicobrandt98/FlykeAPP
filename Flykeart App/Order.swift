//
//  Order.swift
//  Flykeart App
//
//  Created by Akhil Pothana on 5/29/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import Foundation

class Order{
    
    let name: String
    let seat: String
    let drinkChoice: String
    let snackChoice: String
    
    init(orderItems : [String:String]) {
        self.name = orderItems["name"]!
        self.seat = orderItems["seat"]!
        self.drinkChoice = orderItems["drink"]!
        self.snackChoice = orderItems["snack"]!
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getSeat() -> String {
        return self.seat
    }
    
    public func getDrinkChoice() -> String {
        return self.drinkChoice
    }
    
    public func getSnackChoice() -> String {
        return self.snackChoice
    }
    
}
