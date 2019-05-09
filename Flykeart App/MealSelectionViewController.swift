//
//  MealSelectionViewController.swift
//  Flykeart App
//
//  Created by Federico Brandt on 4/25/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import UIKit

class MealSelectionViewController: UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var selectedDrinkLabel: UILabel!
    @IBOutlet weak var selectedSnackLabel: UILabel!
    
    //Water Button
    @IBOutlet weak var waterBottleButton: UIButton!
    @IBAction func waterBottleClicked(_ sender: Any) {
        selectedDrinkLabel.text = "Water"
        self.drinkChoice = selectedSnackLabel.text!
        
        if waterBottleButton.currentImage == UIImage(named: "WaterBottle"){
            waterBottleButton.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
            sodaCanButton.setImage(UIImage(named: "SodaCan"), for: UIControl.State.normal)
            noneButtonDrinks.setImage(UIImage(named: "None"), for: UIControl.State.normal)
        }
        else{
            waterBottleButton.setImage(UIImage(named: "WaterBottle"), for: UIControl.State.normal)
            sodaCanButton.setImage(UIImage(named: "SodaCan"), for: UIControl.State.normal)
            noneButtonDrinks.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedDrinkLabel.text = ""
        }
    }
    //Soda Can Button
    @IBOutlet weak var sodaCanButton: UIButton!
    @IBAction func sodaCanClicked(_ sender: Any) {
        selectedDrinkLabel.text = "Coke"
        self.drinkChoice = selectedSnackLabel.text!
        
        if sodaCanButton.currentImage == UIImage(named: "SodaCan"){
            sodaCanButton.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
            noneButtonDrinks.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            waterBottleButton.setImage(UIImage(named: "WaterBottle"), for: UIControl.State.normal)
        }
        else{
            waterBottleButton.setImage(UIImage(named: "WaterBottle"), for: UIControl.State.normal)
            sodaCanButton.setImage(UIImage(named: "SodaCan"), for: UIControl.State.normal)
            noneButtonDrinks.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedDrinkLabel.text = ""
        }
    }
    //None Button Drink
    @IBOutlet weak var noneButtonDrinks: UIButton!
    @IBAction func noneButtonDClicked(_ sender: Any) {
        selectedDrinkLabel.text = "None"
        self.drinkChoice = selectedSnackLabel.text!
        
        if noneButtonDrinks.currentImage == UIImage(named: "None"){
            noneButtonDrinks.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
            sodaCanButton.setImage(UIImage(named: "SodaCan"), for: UIControl.State.normal)
            waterBottleButton.setImage(UIImage(named: "WaterBottle"), for: UIControl.State.normal)
        }
        else{
            waterBottleButton.setImage(UIImage(named: "WaterBottle"), for: UIControl.State.normal)
            sodaCanButton.setImage(UIImage(named: "SodaCan"), for: UIControl.State.normal)
            noneButtonDrinks.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedDrinkLabel.text = ""
        }
    }
    //Pretzel Button
    @IBOutlet weak var pretzelButton: UIButton!
    @IBAction func pretzelClicked(_ sender: Any) {
        selectedSnackLabel.text = "Pretzels"
        self.snackChoice = selectedSnackLabel.text!
        
        if pretzelButton.currentImage == UIImage(named: "Pretzel"){
            pretzelButton.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Peanuts"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "None"), for: UIControl.State.normal)
        }
        else{
            pretzelButton.setImage(UIImage(named: "Pretzel"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Peanuts"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedSnackLabel.text = ""
        }
    }
    
    //Peanuts Button
    @IBOutlet weak var peanutsButton: UIButton!
    @IBAction func peanutsClicked(_ sender: Any) {
        selectedSnackLabel.text = "Peanuts"
        self.snackChoice = selectedSnackLabel.text!
        
        if peanutsButton.currentImage == UIImage(named: "Peanuts"){
            pretzelButton.setImage(UIImage(named: "Pretzel"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "None"), for: UIControl.State.normal)
        }
        else{
            pretzelButton.setImage(UIImage(named: "Pretzel"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Peanuts"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedSnackLabel.text = ""
        }
    }
    //None Button Snack
    @IBOutlet weak var noneButtonS: UIButton!
    @IBAction func noneSClicked(_ sender: Any) {
        selectedSnackLabel.text = "None"
        self.snackChoice = selectedSnackLabel.text!
        
        if noneButtonS.currentImage == UIImage(named: "None"){
            pretzelButton.setImage(UIImage(named: "Pretzel"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Peanuts"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "Done"), for: UIControl.State.normal)
        }
        else{
            pretzelButton.setImage(UIImage(named: "Pretzel"), for: UIControl.State.normal)
            peanutsButton.setImage(UIImage(named: "Peanuts"), for: UIControl.State.normal)
            noneButtonS.setImage(UIImage(named: "None"), for: UIControl.State.normal)
            selectedSnackLabel.text = ""
        }
    }
    //Submit Order Button
    @IBOutlet weak var submitOrderButton: UIButton!
    
    
    
    @IBAction func GoBackTest(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Get Seat From first Window
    var name: String = ""
    var seat: String = ""
    var orderArray = [ViewController.Order]()
    var seatList = [String]()
    
    var snackChoice: String = ""
    var drinkChoice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Info from first screen
        nameLabel.text = name
        seatLabel.text = seat
        
        //Initiate Buttons
        waterBottleButton.layer.cornerRadius = 0.5 * waterBottleButton.bounds.size.width
        sodaCanButton.layer.cornerRadius = 0.5 * sodaCanButton.bounds.size.width
        noneButtonDrinks.layer.cornerRadius = 0.5 * noneButtonDrinks.bounds.size.width
        pretzelButton.layer.cornerRadius = 0.5 * pretzelButton.bounds.size.width
        peanutsButton.layer.cornerRadius = 0.5 * peanutsButton.bounds.size.width
        noneButtonS.layer.cornerRadius = 0.5 * noneButtonS.bounds.size.width
        submitOrderButton.layer.cornerRadius = 15

        
        //Initiate Labels
        selectedDrinkLabel.text = ""
        selectedSnackLabel.text = ""
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        if  selectedDrinkLabel.text! != ""{
            if  selectedSnackLabel.text! != ""{
                
                seatList.remove(at: Int(self.seatList.index(of: self.seat)!))
                
                destVC.name = self.name
                destVC.seat = self.seat
                destVC.drinkChoice = selectedDrinkLabel.text!
                destVC.snackChoice = selectedSnackLabel.text!
                destVC.Orders = orderArray
                destVC.seats = seatList
            }
            else{
                let seatAlert = UIAlertController(title: "Please Choose a Snack", message: nil, preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                seatAlert.addAction(okAction)
                self.present(seatAlert, animated: true, completion: nil)
            }
        }
        else{
            let nameAlert = UIAlertController(title: "Please Choose a Drink", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            nameAlert.addAction(okAction)
            self.present(nameAlert, animated: true, completion: nil)
        }
    }
/*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
