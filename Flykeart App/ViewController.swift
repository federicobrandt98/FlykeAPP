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
    
    //Order Array
    var Orders:[Order] = []
    
    @IBOutlet weak var manualModeButton: UIButton!
    @IBOutlet weak var flightAttendantButton: UIButton!
    @IBOutlet weak var SeatScroller: UIPickerView!
    @IBOutlet weak var getMealButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var seat: String = ""
    var name: String = ""
    
    //Setup Buttons
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getMealButton.layer.cornerRadius = 15
        self.manualModeButton.layer.cornerRadius = 15
        self.flightAttendantButton.layer.cornerRadius = 15
        
        SeatScroller.reloadAllComponents()
    }
    
    
    @IBAction func getMealClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMenuSelectionView", sender: "getMealButton")
    }

    @IBAction func FAViewClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFlightAttendantView", sender: "FAViewButton")
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
    
    //Scroll Down for Seats
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
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
        
        if sender as! String == "getMealButton" {
            
            let destVC : MealSelectionViewController = segue.destination as! MealSelectionViewController
            if nameTextField.text! != ""{
                if self.seat != ""{
                    destVC.seat = self.seat
                    destVC.name = nameTextField.text!
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
    }
}

