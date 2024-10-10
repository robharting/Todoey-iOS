//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Harting, R.P.G. (Rob) on 07/10/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit
//import CoreData // refactored to Realm
import RealmSwift

class CategoryViewController: UITableViewController {
    
    // create a new Realm database
    let realm = try! Realm()
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        // loadCategories()
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
        // saveCategories()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    
    //MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
//        
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error loading categories: \(error)")
//        }
//        
//        tableView.reloadData()
    }
    
    //MARK: Add New Categories
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        // closure
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            field.placeholder = "Add new category"
            
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
