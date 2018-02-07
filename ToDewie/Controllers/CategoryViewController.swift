//
//  CategoryViewController.swift
//  ToDewie
//
//  Created by Holiday Twin Drive-In on 1/17/18.
//  Copyright © 2018 Josh. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()

    }

    //    MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
//        Nil coalessing optional
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categroies added yet."
        
     
        
        //        Ternary operator which functions the same as the code below it.
        //       cell.accessoryType = item.done ? .checkmark : .none
        
        //        if item.done == true {
        //            cell.accessoryType = .checkmark
        //        } else {
        //            cell.accessoryType = .none
        //        }
        
        
        return cell
        
    }
    
    
    //    MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(categories[indexPath.row])
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    //    MARK: - Data Manipulation Methods
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
            var textField = UITextField()
            
            let alert = UIAlertController(title: "Add new ToDoweie Category", message: "", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Add", style: .default) { (action) in
                //      What happens when user presses add button
                
                
                let newCategory = Category()
                
                newCategory.name = textField.text!
                
//              realm results auto update
                
                self.save(category: newCategory)
                
        }
            alert.addAction(action)
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Add a new Category"
                textField = alertTextField
                
                
        }
            
            present(alert, animated: true, completion: nil)
        
    }


// MARK: - Model Manipulation methods

    func save(category: Category) {
    
    
    do {
        try realm.write {
            realm.add(category)
        }
    } catch {
        print("Error saving context with \(error)")
    }
    
    
    self.tableView.reloadData()
}

func loadCategories() {
    categories = realm.objects(Category.self)
    self.tableView.reloadData()
}

}






    

