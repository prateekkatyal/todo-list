//
//  ToDoListTableViewController.swift
//  ToDo List
//
//  Created by Prateek Katyal on 07/10/18.
//  Copyright © 2018 Prateek Katyal. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDos = [ToDo]() // An array of ToDo (class)
    
    
    // Calling getToDos everytime the viewcontroller is loaded. (Also deleted the viewDidLoad function since it only loads the first time.
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        
        // Initialise CoreData Context
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let toDosFromCoreData = try? context.fetch(ToDo.fetchRequest()) {
                
                if let tempToDos = toDosFromCoreData as? [ToDo] {
                    toDos = tempToDos
                    
                    tableView.reloadData()
                    
                }
                
            }
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // How many table cells in tableviewcontroller?
        
        return toDos.count
        // Returns the number of elements in an array to fill the table view.
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // Configure the cell...
        
        let cell = UITableViewCell()
        
        let currentToDo = toDos[indexPath.row]  // added the class into a variable for easy access in code
        
        if currentToDo.important {
            
            if let name = currentToDo.name {
                cell.textLabel?.text = "‼️ \(currentToDo.name)"
            }
            
            
        } else {
            cell.textLabel?.text = currentToDo.name
        }
        
        
        
        return cell
    }
    
    // Func called when someone taps a cell
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedToDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: selectedToDo)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let createVC = segue.destination as? AddToDoViewController {
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
           
            if let selectedToDo = sender as? ToDo {
                
                completeVC.toDo = selectedToDo
                
            }
 
        }
        
    }
    
}
