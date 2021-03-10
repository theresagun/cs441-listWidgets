//
//  ViewController.swift
//  cs441-listWidgets
//
//  Created by Theresa Gundel on 3/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var pricefield: UITextField!
    @IBOutlet var totalItems: UILabel!
    @IBOutlet var totalPrice: UILabel!
    
    let items = NSMutableArray()
    var prices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
            
        //default values in list, maybe change/remove
        items.add("Apples")
        prices.append(4)
        items.add("Banana")
        prices.append(2.50)
        
        totalItems.text = String(items.count)
        let p = "$" + String(prices.reduce(0,+))
        totalPrice.text = p
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if we have an array, return the size of the array items.count
        //lazy way:
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init()
        }
        var setText = (items[Int(indexPath.row)] as! String)
        setText.append(", $")
        setText.append(String(prices[Int(indexPath.row)]))
        cell?.textLabel?.text = setText

        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.setEditing(true, animated: true)
    }
    
    @IBAction func addItem(button: UIButton){
        let s = textfield.text
        let price = Double(pricefield.text!)!
        items.add(s)
        prices.append(price)
        textfield.text = ""
        pricefield.text = ""
        
        totalItems.text = String(items.count)
        let p = "$" + String(prices.reduce(0,+))
        totalPrice.text = p
       
        
        tableView.reloadData()
    }

}

