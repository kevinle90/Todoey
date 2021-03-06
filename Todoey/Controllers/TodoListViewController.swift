//
//  ViewController.swift
//  Todoey
//
//  Created by Kevin Le on 12/10/18.
//  Copyright © 2018 Kevin Le. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard // For saving
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Memogorgon"
        itemArray.append(newItem3)
        
        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {

            itemArray = items
        }
    }
    
    //Mark - TableView Datasource Methods
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexPath contains properties such as row and sections and specifies where the cell at row 1
        
        // Also the cellForRowAt "loop" through the amount of the array
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title // Added .title because we want to tap into its title property using the dot notation
        
        // Ternary operator:    value = condition ? valueIfTrue : valueIfFalse
        
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//
//        if item.done == true {
//
//            cell.accessoryType = .checkmark
//        }
//        else {
//
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - TableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    // For the row to be high lighted
        
        // print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done // Opposite of if it has a checkmark or not
        
        
        tableView.reloadData()
        
        
        tableView.deselectRow(at: indexPath, animated: true)    // Flashes gray
    }
    
    //MARK - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the add item button on your UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
     
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            
            textField = alertTextField

            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

