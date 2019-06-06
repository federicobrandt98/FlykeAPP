//
//  servedViewController.swift
//  Flykeart App
//
//  Created by Federico Brandt on 6/2/19.
//  Copyright © 2019 Federico Brandt. All rights reserved.
//

import UIKit

class servedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var servedList : [Order] = []

    @IBOutlet weak var servedTableView: UITableView!
    
    @IBAction func backOrders(_ sender: Any) {
        print(servedList[0].name)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        servedTableView.dataSource = self
        servedTableView.delegate = self

        loadServedOrders()
        
        // Do any additional setup after loading the view.
    }
    
    private func loadServedOrders() {
        FirebaseClient.getServedOrders(completion: {(result) in
            guard let newOrder = result else {return}
            self.servedList.append(newOrder)
            self.servedTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = servedTableView.dequeueReusableCell(withIdentifier: "servedCell") as! ServedTableViewCell
        cell.drinkLabel.text = servedList[indexPath.item].drinkChoice
        cell.snackLabel.text = servedList[indexPath.item].snackChoice
        cell.nameLabel.text = servedList[indexPath.item].name
        cell.seatLabel.text = servedList[indexPath.item].seat
        
        return cell
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
