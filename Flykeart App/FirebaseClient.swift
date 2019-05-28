//
//  FirebaseClient.swift
//  Flykeart App
//
//  Created by Akhil Pothana on 5/28/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//
// A singleton for performing all interactions with Firebase

import Foundation
import FirebaseDatabase

struct FirebaseClient {
    
    static let currentOrdersRef = Database.database().reference().child("CurrentOrders")
    
    static func uploadMenuSelection(seat: String, name: String, snack: String, drink: String) {
        
        let orderItem = ["seat" : seat, "name" : name, "snack" : snack, "drink" : drink] as [String : Any]
        
        currentOrdersRef.child("seat-\(seat)").updateChildValues(orderItem) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // Download the current list of orders
    static func getCurrentOrders() {
        
        currentOrdersRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as! [String : Any]
            
            print(postDict)
        })
        
    }
}
