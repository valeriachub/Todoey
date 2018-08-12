//
//  ViewController.swift
//  Todoey
//
//  Created by Valeria on 11.08.2018.
//  Copyright © 2018 Valeria. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArrayKey = "TodoListArray"
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillItemArray()
        
        if let items =  defaults.array(forKey: itemArrayKey) as? [Item] {
            itemArray = items
        }
    }
    
    //MARK: - Temp methods
    
    func fillItemArray(){
        let newItem = Item()
        newItem.title = "Food List"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Home List"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Work Tasks"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Friends"
        itemArray.append(newItem4)
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) {
            (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: self.itemArrayKey)
            
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

