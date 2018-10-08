//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Prateek Katyal on 07/10/18.
//  Copyright © 2018 Prateek Katyal. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet weak var nameToDo: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // 
    var toDoTableVC : ToDoListTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Initialising Managed Object and storing it into a variable for CoreData
        // Whenever you work with CoreData you need - Managed Object Context
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            // Created new todo object and connected it with coredata
            
            let newToDo = ToDo(context: context)
            
            
            newToDo.important = importantSwitch.isOn
            
            // Using optional unrwapping so that the text entered in field is sent back to array
            
            if let name = nameTextField.text {
                newToDo.name = name
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        
        
        // is the switch on or not? Setting the objects property
        
        
        
        navigationController?.popViewController(animated: true) // basically leads us to the main screen after todo is added
        
    }
    

}
