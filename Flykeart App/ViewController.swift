//
//  ViewController.swift
//  Flykeart App
//
//  Created by Federico Brandt on 4/24/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Seat Selection Array
    var seats = ["1A", "1B", "1C", "1D", "1E",
                 "2A", "2B", "2C", "2D", "2E",
                 "3A", "3B", "3C", "3D", "3E",
                 "4A", "4B", "4C", "4D", "4E",
                 "5A", "5B", "5C", "5D", "5E"]
    var indexOfSeats = Int()
    
    //Order Array
    var Orders:[Order] = []
    var OrdersBack:[Order] = []

    var getOrderClicked = false
    var FAViewClicked = false
    
    @IBOutlet weak var manualModeButton: UIButton!
    
    @IBOutlet weak var flightAttendantButton: UIButton!
    
    @IBOutlet weak var SeatScroller: UIPickerView!
    
    @IBOutlet weak var getMealButton: UIButton!
    @IBAction func getMealClicked(_ sender: Any) {
        FAViewClicked = false
        getOrderClicked = true
        
        performSegue(withIdentifier: "toMenuSelectionView", sender: nil)
        
    }

    @IBAction func FAViewClicked(_ sender: Any) {
        FAViewClicked = true
        getOrderClicked = false
        self.seat = ""
        self.name = ""
        self.drinkChoice = ""
        self.snackChoice = ""
        
        sortArray(Orders: self.Orders)
        
        performSegue(withIdentifier: "toFlightAttendantView", sender: nil)
        
    }
    
    @IBAction func doNotDisturb(_ sender:UIButton){
        if nameTextField.text! != ""{
        if self.seat != ""{
                let arrayAlert = UIAlertController(title: "All Done!", message: "Please let us know if you need assistance", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                arrayAlert.addAction(okAction)
                self.present(arrayAlert, animated: true, completion: nil)
            
                seats.remove(at: Int(self.seats.index(of: self.seat)!))
                self.seat = ""
                SeatScroller.reloadAllComponents()
            }
            else{
                let arrayAlert = UIAlertController(title: "Please Choose a Seat", message: nil, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                arrayAlert.addAction(okAction)
                self.present(arrayAlert, animated: true, completion: nil)
                SeatScroller.reloadAllComponents()
            }
        }
        else{
            let nameAlert = UIAlertController(title: "Please Enter a Name", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            nameAlert.addAction(okAction)
            self.present(nameAlert, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var seat: String = ""
    var name: String = ""
    var snackChoice: String = ""
    var drinkChoice: String = ""
    
    //Scroll Down for Seats
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        indexOfSeats = row
        return seats[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seats.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.seat = seats[row]
    }
    //End of Scroll Down
    
    
    //Segue for Second Window
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if getOrderClicked{
        
            let destVC : MealSelectionViewController = segue.destination as! MealSelectionViewController
            if nameTextField.text! != ""{
                if self.seat != ""{
                    destVC.seat = self.seat
                    destVC.name = nameTextField.text!
                    destVC.orderArray = self.Orders
                    destVC.seatList = self.seats
                }
                else{
                    let seatAlert = UIAlertController(title: "Please Choose a Seat", message: nil, preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    seatAlert.addAction(okAction)
                    self.present(seatAlert, animated: true, completion: nil)
                }
            }
            else{
                let nameAlert = UIAlertController(title: "Please Enter a Name", message: nil, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                nameAlert.addAction(okAction)
                self.present(nameAlert, animated: true, completion: nil)
            }
        }
        else if FAViewClicked{
            let destVC : FlightAttendantViewController = segue.destination as! FlightAttendantViewController
                destVC.orders = self.Orders
                destVC.seats = self.seats
        }
    }
    //End of Segue
    
    
    //Setup Buttons
    override func viewDidLoad() {
        super.viewDidLoad()
        settupButtons(self.getMealButton, Manual: self.manualModeButton, FAButton: self.flightAttendantButton)/*
        if FAViewClicked{
            self.Orders = self.OrdersBack
        }*/
        
        getOrderClicked = false
        FAViewClicked = false

        SeatScroller.reloadAllComponents()
        if self.drinkChoice != "" && self.snackChoice != ""{
            
            if self.drinkChoice != "None" || self.snackChoice != "None"{
                let order = Order(name: self.name,seat: self.seat,drinkChoice: self.drinkChoice,snackChoice: self.snackChoice)
                self.seat = ""
                Orders.append(order)
            }
        }
        
        printArray(Orders: self.Orders)
        printArray(Orders: self.OrdersBack)
    }

    
    func settupButtons (_ GetMeal: UIButton, Manual: UIButton, FAButton: UIButton){
        GetMeal.layer.cornerRadius = 15
        Manual.layer.cornerRadius = 15
        FAButton.layer.cornerRadius = 15
    }

    //Declare Order Class
    class Order{
        var name: String
        var seat: String
        var drinkChoice: String
        var snackChoice: String
        
        init(name: String, seat: String, drinkChoice: String, snackChoice: String) {
            self.name = name
            self.seat = seat
            self.drinkChoice = drinkChoice
            self.snackChoice = snackChoice
        }
    }
    
    //Print Array of Orders
    func printArray(Orders: Array<Order>){
        print("Main Menu Orders")
        if Orders.count != 0{
            for order in Orders{
                print(order.name)
                print(order.seat)
                print(order.drinkChoice)
                print(order.snackChoice)
                print("\n")
            }
        }
        else{
            print("None \n")
        }
    }
    
    //Sort Array
    func sortArray(Orders: Array<Order>){
        self.Orders = Orders.sorted(by: {$0.seat.prefix(1) > $1.seat.prefix(1)})
        self.Orders = Orders.sorted(by: {$0.seat.suffix(1) < $1.seat.suffix(1)})
    }
    
}

