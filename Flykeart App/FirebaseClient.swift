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
                return
            }
            
            print(ref.child("seat"))
        }
    }
    
    // Download the current list of orders as a dictionary
    static func getCurrentOrders(completion : @escaping (Order?) -> ()) -> Void {
        
        currentOrdersRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as! [String : Any]
            
            for item in postDict {
                let order = Order(orderItems: item.value as! [String : String])
                completion(order)
            }
        })
    }
    
    // Download the current list of orders as a dictionary
    static func getNewOrder(completion : @escaping (Order?) -> ()) -> Void {
        
        currentOrdersRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as! [String : Any]
            
            let item = postDict.keys.sorted().last.map({ ($0, postDict[$0]!) })
            print(item)
            completion(nil)
            
        })
    }
    
    // Delete an order from the list
    static func deleteOrder(seatNumber : String) {
        
        let orderItem = ["":""]
        
        currentOrdersRef.child("\(seatNumber)").updateChildValues(orderItem) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
}
