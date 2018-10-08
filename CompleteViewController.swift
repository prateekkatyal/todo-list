//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Prateek Katyal on 07/10/18.
//  Copyright © 2018 Prateek Katyal. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    
    @IBOutlet weak var showTheItem: UILabel!
    
    
    var toDo : ToDo? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let toDo = toDo {
        
        if toDo.important {
            
            if let name = toDo.name {
                showTheItem.text = "‼️ \(toDo.name)"
            }
            
            
        } else {
            showTheItem.text = toDo.name
        }
        
        }
        
    }
    
    @IBAction func complete(_ sender: Any) {
        
        // Delete Todo
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let toDo = toDo {
            context.delete(toDo)
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        
        // Pop back to the previous view controller
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
