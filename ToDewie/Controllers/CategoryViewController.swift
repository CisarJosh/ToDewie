//
//  CategoryViewController.swift
//  ToDewie
//
//  Created by Holiday Twin Drive-In on 1/17/18.
//  Copyright © 2018 Josh. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    
//    var itemArray = [Item]()
//
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    var categoryArray = [Category]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Category.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()

    }

    //    MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        
        cell.textLabel?.text = category.name
        
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
        print(categoryArray[indexPath.row])
        
        
        //        context.delete(itemArray[indexPath.row])
        //        context.delete() must be called first
        //        itemArray.remove(at: indexPath.row)
        
        //        categoryArray[indexPath.row].done = !categoryArray[indexPath.row].done
        
//        saveItems()
        //        You have to .save() in order to Create Update or Destroy data.
        //        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //    MARK: - Data Manipulation Methods
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
            var textField = UITextField()
            
            let alert = UIAlertController(title: "Add new ToDoweie Category", message: "", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
                //      What happens when user presses add button
                
                
                let newCategory = Category(context: self.context)
               
                
                newCategory.name = textField.text!
                
                self.categoryArray.append(newCategory)
                
                self.saveItems()
                
            }
            alert.addAction(action)
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Add a new Category"
                textField = alertTextField
            }
            
            present(alert, animated: true, completion: nil)
        
    }


// MARK: - Model Manipulation methods

func saveItems() {
    
    
    do {
        try self.context.save()
    } catch {
        print("Error saving context with \(error)")
    }
    
    
    self.tableView.reloadData()
}

func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
    
    do {
        categoryArray = try context.fetch(request)
    } catch {
        print("Error fetching data from context \(error)")
    }
}

}






    

