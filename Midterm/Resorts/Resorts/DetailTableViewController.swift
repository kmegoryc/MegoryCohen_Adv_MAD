//
//  DetailTableViewController.swift
//  Resorts
//
//  Created by Keren Megory-Cohen on 3/16/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    //initialize listed items as an empty array
    var list = [String]()
    var searchController : UISearchController!

    
    var runs = [String]()
    var selectedResort = 0
    var resortListDetail = Resorts()
    
    override func viewWillAppear(_ animated: Bool) {
        resortListDetail.resorts = Array(resortListDetail.resortsData.keys)
        let chosenResort = resortListDetail.resorts[selectedResort]
        list = resortListDetail.resortsData[chosenResort]! as [String]
        
        //search results
        let resultsController = Search() //create an instance of our Search class
        resultsController.allwords = list //set the allwords property to our list array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Search..." //place holder text
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the country from the array
            list.remove(at: indexPath.row)
            let chosenResort = resortListDetail.resorts[selectedResort]
            //Delete from the data model
            resortListDetail.resortsData[chosenResort]?.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }

    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = toIndexPath.row //row being moved to
        let moveRun = runs[fromRow] //country being moved
        //move in array
        list.remove(at: fromRow)
        list.insert(moveRun, at: toRow)
        //move in data model
        let chosenResort = resortListDetail.resorts[selectedResort]
        resortListDetail.resortsData[chosenResort]?.remove(at: fromRow)
        resortListDetail.resortsData[chosenResort]?.insert(chosenResort, at: toRow)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddRunViewController
            //only add a country if there is text in the textfield
            if ((source.addedRun.isEmpty) == false){
                list.append(source.addedRun)
                tableView.reloadData()
                let chosenResort = resortListDetail.resorts[selectedResort]
                resortListDetail.resortsData[chosenResort]?.append(source.addedRun)
            }
        }
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
