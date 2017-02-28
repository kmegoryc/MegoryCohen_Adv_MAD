//
//  DetailTableViewController.swift
//  Ahead
//
//  Created by Keren Megory-Cohen on 2/23/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    //initialize listed items as an empty array
    var list = [String]()
    var selectedCategory = 0
    
    //initialize todoList as an instance of Categories
    var todoList = Categories()
    
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        //puts all categories into an array
        todoList.categories = Array(todoList.categoriesData.keys)
        //load the selected category of the categories array
        let chosenCategory = todoList.categories[selectedCategory]
        //make the list array equal to the array at the chosen category
        list = todoList.categoriesData[chosenCategory]! as [String]
        
        //search results
        let resultsController = Search() //create an instance of our Search class
        resultsController.allwords = list //set the allwords property to our list array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Search..." //place holder text
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddItemViewController
            //only add Item if the textField wasn't empty
            if ((source.addedItem.isEmpty) == false){
                list.append(source.addedItem) //add item to list array
                tableView.reloadData()
                //add item to data model
                let chosenCategory = todoList.categories[selectedCategory]
                todoList.categoriesData[chosenCategory]?.append(source.addedItem)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete row from list array
            list.remove(at: indexPath.row)
            //delete row from data model
            let chosenCategory = todoList.categories[selectedCategory]
            todoList.categoriesData[chosenCategory]?.remove(at: indexPath.row)
            //delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let sourceRow = fromIndexPath.row //row being moved from
        let destRow = toIndexPath.row //row being moved to
        let moveItem = list[sourceRow] //identify which item in the array will be moved
        list.remove(at: sourceRow)
        list.insert(moveItem, at: destRow)
        //move in data model
        let chosenCategory = todoList.categories[selectedCategory]
        todoList.categoriesData[chosenCategory]?.remove(at: sourceRow)
        todoList.categoriesData[chosenCategory]?.insert(moveItem, at: destRow)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
}

