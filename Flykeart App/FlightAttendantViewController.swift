//
//  FlightAttendantViewController.swift
//  Flykeart App
//
//  Created by Federico Brandt on 4/27/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import UIKit

class FlightAttendantViewController: UIViewController {

    var seats = [String]()
    
    @IBAction func goBackClicked(_ sender: Any) {
    }
    @IBOutlet weak var orderTable: UITableView!
    
    

    
    @IBOutlet weak var WaterAmount: UILabel!
    @IBOutlet weak var CokeAmount: UILabel!
    @IBOutlet weak var PeanutsAmount: UILabel!
    @IBOutlet weak var PretzelsAmount: UILabel!
    
    var waterAmount = 0
    var cokeAmount = 0
    var peanutsAmount = 0
    var pretzelsAmount = 0
    
    var orders = [ViewController.Order]()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        destVC.Orders = orders
        destVC.seats = seats
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTotal()

        orderTable.dataSource = self
        orderTable.delegate = self
        printArray(Orders: orders)
        // Do any additional setup after loading the view.
    }
    
    func printArray(Orders: [ViewController.Order]){
        print("Flight Attendant Orders")
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
            print("None\n")
        }
    }

    func loadTotal(){
        
        waterAmount = 0
        cokeAmount = 0
        peanutsAmount = 0
        pretzelsAmount = 0
        
        if orders.count != 0{
            for order in self.orders{
                
                if order.drinkChoice == "Water"{
                    waterAmount += 1
                }
                if order.drinkChoice == "Coke"{
                    cokeAmount += 1
                }
                if order.snackChoice == "Peanuts"{
                    peanutsAmount += 1
                }
                if order.snackChoice == "Pretzels"{
                    pretzelsAmount += 1
                }
            }
        }
        
        WaterAmount.text = String(waterAmount)
        CokeAmount.text = String(cokeAmount)
        PretzelsAmount.text = String(pretzelsAmount)
        PeanutsAmount.text = String(peanutsAmount)
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


extension FlightAttendantViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = orders[indexPath.row].name
        let seat = orders[indexPath.row].seat
        let drink = orders[indexPath.row].drinkChoice
        let snack = orders[indexPath.row].snackChoice
        
        let cell = orderTable.dequeueReusableCell(withIdentifier: "Order")! as! OrderCellTableViewCell
        
        cell.nameInOrder.text = name
        cell.seatInOrder.text = seat
        cell.drinkInOrder.text = drink
        cell.snackInOrder.text = snack
        cell.serveButton.layer.cornerRadius = 15
        
        if let btnServe = cell.contentView.viewWithTag(101) as? UIButton{
            btnServe.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        }
        
        return cell
    }
    
    @objc func deleteRow(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: orderTable)
        guard let indexPath = orderTable.indexPathForRow(at: point) else{
            return
        }
        orders.remove(at: indexPath.row)
        orderTable.deleteRows(at: [indexPath], with: .left)
        loadTotal()
        
    }
}

