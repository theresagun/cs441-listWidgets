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
    
    let items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
            
        //default values in list, maybe change/remove
        items.add("Apple")
        items.add("Banana")
        
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
        cell?.textLabel?.text = (items[Int(indexPath.row)] as! String)
        return cell!
    }
    
    @IBAction func addItem(button: UIButton){
        let s = textfield.text
        items.add(s)
        textfield.text = ""
        tableView.reloadData()
    }

}

