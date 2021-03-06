//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Kenji Fukuda on 2018/11/03.
//  Copyright © 2018年 Kenji Fukuda. All rights reserved.
//  Section 18 Lecture 250 3:44

import UIKit
//import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    // initialize new access point of Realm
    var realm = try! Realm()
    
    // categories changed to Results<Category> from Array
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // When view is loaded all categories are loaded up
        loadCategories()
    }
    
    //MARK: - Table View Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        do {
            // commit changes
            try realm.write {
                // and then add
                realm.add(category)
            }
            
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        // fetch all objects of Category
        categories = realm.objects(Category.self)

        // the following relaodData() relaod Datasource Table Views
        tableView.reloadData()
    }
    
    
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action: UIAlertAction) in
            
            // new Category object is created
            let newCategory = Category()
            newCategory.name = textField.text!
            // As Results<Category> is an auto-updating container, we don't need to append
            // self.categories.append(newCategory)
            
            self.save(category: newCategory)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
}
