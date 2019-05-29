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
    
    @IBOutlet weak var orderTable: UITableView!
    
    @IBOutlet weak var WaterAmount: UILabel!
    @IBOutlet weak var CokeAmount: UILabel!
    @IBOutlet weak var PeanutsAmount: UILabel!
    @IBOutlet weak var PretzelsAmount: UILabel!
    
    var waterAmount = 0
    var cokeAmount = 0
    var peanutsAmount = 0
    var pretzelsAmount = 0
    
    var orderList : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderTable.dataSource = self
        orderTable.delegate = self
        super.view.addSubview(orderTable)
        
        loadTotal()
        loadOrders()
        loadNewOrder()
        
        orderTable.dataSource = self
        orderTable.delegate = self
    }
    
    @IBAction func goBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadOrders() {
        FirebaseClient.getCurrentOrders(completion: {(result) in
            guard let newOrder = result else {return}
            self.orderList.append(newOrder)
            self.orderTable.reloadData()
        })
    }
    
    private func loadNewOrder() {
        FirebaseClient.getNewOrder(completion: {(result) in
            guard let newOrder = result else {return}
            self.orderList.append(newOrder)
            self.orderTable.reloadData()
        })
    }

    func loadTotal(){
        
        waterAmount = 0
        cokeAmount = 0
        peanutsAmount = 0
        pretzelsAmount = 0
        
        if orderList.count != 0{
            for order in self.orderList{
                
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
}


extension FlightAttendantViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = orderTable.dequeueReusableCell(withIdentifier: "OrderCell")! as! OrderCellTableViewCell
        
        if let btnServe = cell.contentView.viewWithTag(101) as? UIButton{
            btnServe.addTarget(self, action: #selector(deleteRow(_ :)), for: .touchUpInside)
        }
        
        let info = orderList[indexPath.row]
        cell.setUpCell(withInfo : info)
        
        return cell
    }
    
    @objc func deleteRow(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: orderTable)
        guard let indexPath = orderTable.indexPathForRow(at: point) else{
            return
        }
        orderList.remove(at: indexPath.row)
        orderTable.deleteRows(at: [indexPath], with: .left)
        loadTotal()
        
    }
}

