//
//  ViewController.swift
//  Todoey
//
//  Created by Kevin Le on 12/10/18.
//  Copyright © 2018 Kevin Le. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Mark - TableView Datasource Methods
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // indexPath contains properties such as row and sections and specifies where the cell at row 1
        
        // Also the cellForRowAt "loop" through the amount of the array
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableViewDelegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    // For the row to be high lighted
        
        // print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }
    
        else {
    
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
    }
        
        
        tableView.deselectRow(at: indexPath, animated: true)    // Flashes gray
    }
    
    
    
}

