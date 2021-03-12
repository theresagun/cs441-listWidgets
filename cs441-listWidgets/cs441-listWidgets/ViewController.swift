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
    
    var items: [String] = []
    var prices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
            
        //default values in list, maybe change/remove
        items.append("Apples")
        prices.append(4)
        items.append("Banana")
        prices.append(2.50)
        
        reloadScreen()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init()
        }
        var setText = (String(items[Int(indexPath.row)]))
        setText.append(", $")
        setText.append(String(prices[Int(indexPath.row)]))
        cell?.textLabel?.text = setText

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.setEditing(true, animated: true)
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                items.remove(at: indexPath.row)
                prices.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                reloadScreen()
            }
    }
    
    func reloadScreen(){
        totalItems.text = String(items.count)
        let p = "$" + String(prices.reduce(0,+))
        totalPrice.text = p
    }
    
    @IBAction func addItem(button: UIButton){
        let s = textfield.text
        let price = Double(pricefield.text!)!
        items.append(String(s!))
        prices.append(price)
        textfield.text = ""
        pricefield.text = ""
        
        reloadScreen()
        tableView.reloadData()
    }

}

